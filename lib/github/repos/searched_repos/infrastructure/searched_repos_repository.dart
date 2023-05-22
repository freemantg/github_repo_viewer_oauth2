import 'package:dartz/dartz.dart';
import 'package:github_repo_viewer_oauth2/core/infrastructure/network_exceptions.dart';
import 'package:github_repo_viewer_oauth2/github/repos/core/infrastructure/extensions.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/fresh.dart';
import '../../../core/domain/github_failure.dart';
import '../../../core/domain/github_repo.dart';
import 'searched_repos_remote_service.dart';

@Injectable()
class SearchedReposRepository {
  final SearchedReposRemoteService _remoteService;

  SearchedReposRepository(this._remoteService);

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getSearchedReposPage(
    String query,
    int page,
  ) async {
    try {
      final remotePageItems =
          await _remoteService.getStarredReposPage(query, page);
      return right(remotePageItems.maybeWhen(
        withNewData: (data, maxPage) => Fresh.yes(
          data.toDomain(),
          isNextPageAvailable: page < maxPage,
        ),
        orElse: () => Fresh.no([], isNextPageAvailable: false),
      ));
    } on RestApiException catch (e) {
      return left(GithubFailure.api(e.errorCode));
    }
  }
}
