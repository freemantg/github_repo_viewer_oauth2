import 'package:dartz/dartz.dart';
import 'package:github_repo_viewer_oauth2/core/infrastructure/network_exceptions.dart';
import 'package:github_repo_viewer_oauth2/github/repos/core/infrastructure/extensions.dart';
import 'package:github_repo_viewer_oauth2/github/repos/starred_repos/infrastructure/starred_repos_local_service.dart';
import 'package:github_repo_viewer_oauth2/github/repos/starred_repos/infrastructure/starred_repos_remote_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/fresh.dart';
import '../../../core/domain/github_failure.dart';
import '../../../core/domain/github_repo.dart';

@Injectable()
class StarredReposRepository {
  final StarredReposRemoteService _remoteService;
  final StarredReposLocalService _localService;

  StarredReposRepository({
    required StarredReposRemoteService remoteService,
    required StarredReposLocalService localService,
  })  : _remoteService = remoteService,
        _localService = localService;

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getStarredReposPage(
    int page,
  ) async {
    try {
      final remotePageItems = await _remoteService.getStarredReposPage(page);
      return right(await remotePageItems.when(
          noConnection: () async => Fresh.no(
                await _localService.getPage(page).then((_) => _.toDomain()),
                isNextPageAvailable:
                    page < await _localService.getLocalPageCount(),
              ),
          notModified: (maxPage) async {
            return Fresh.yes(
              await _localService.getPage(page).then((_) => _.toDomain()),
              isNextPageAvailable: page < maxPage,
            );
          },
          withNewData: (data, maxPage) async {
            await _localService.upsertPage(data, page);
            return Fresh.yes(
              data.toDomain(),
              isNextPageAvailable: page < maxPage,
            );
          }));
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}
