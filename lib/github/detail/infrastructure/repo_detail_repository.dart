import 'package:dartz/dartz.dart';
import 'package:github_repo_viewer_oauth2/core/infrastructure/network_exceptions.dart';
import 'package:github_repo_viewer_oauth2/github/detail/domain/github_repo_detail.dart';
import 'package:github_repo_viewer_oauth2/github/detail/infrastructure/github_repo_detail_dto.dart';
import 'package:github_repo_viewer_oauth2/github/detail/infrastructure/repo_detail_local_service.dart';
import 'package:github_repo_viewer_oauth2/github/detail/infrastructure/repo_detail_remote_service.dart';
import 'package:injectable/injectable.dart';

import '../../../core/domain/fresh.dart';
import '../../core/domain/github_failure.dart';

@Injectable()
class RepoDetailRepository {
  final RepoDetailLocalService _localService;
  final RepoDetailRemoteService _remoteService;

  RepoDetailRepository({
    required RepoDetailLocalService localService,
    required RepoDetailRemoteService remoteService,
  })  : _localService = localService,
        _remoteService = remoteService;

  ///Returns 'right(null)' if there's no Internet connection;
  Future<Either<GithubFailure, Unit?>> switchStarredStatus(
    GithubRepoDetail repoDetail,
  ) async {
    try {
      final actionCompleted = await _remoteService.switchStarredStatus(
        repoDetail.fullName,
        isCurrentlyStarred: repoDetail.starred,
      );
      return right(actionCompleted);
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }

  Future<Either<GithubFailure, Fresh<GithubRepoDetail?>>> getRepoDetail(
      String fullRepoName) async {
    try {
      final htmlRemoteResponse =
          await _remoteService.getReadmeHtml(fullRepoName);

      return right(await htmlRemoteResponse.when(
        noConnection: () async {
          return Fresh.no(
            (await _localService.getGithubRepoDetail(fullRepoName).then(
                  (dto) => dto?.toDomain(),
                )),
          );
        },
        notModified: (_) async {
          final cached = await _localService.getGithubRepoDetail(fullRepoName);
          //Starred status is on a different endpoint w/ no ETag
          final starred = await _remoteService.getStarredStatus(fullRepoName);
          final withUpdatedStarredField =
              cached?.copyWith(starred: starred ?? false);

          return Fresh.yes(withUpdatedStarredField?.toDomain());
        },
        withNewData: (html, _) async {
          final starred = await _remoteService.getStarredStatus(fullRepoName);
          final dto = GithubRepoDetailDTO(
            fullName: fullRepoName,
            html: html,
            starred: starred ?? false,
          );
          await _localService.upsertRepoDetail(dto);
          return Fresh.yes(dto.toDomain());
        },
      ));
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}
