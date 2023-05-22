import 'package:github_repo_viewer_oauth2/github/repos/core/infrastructure/repos_remote_service.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/infrastructure/remote_response.dart';
import '../../../core/infrastructure/github_repo_dto.dart';
import '../../../core/infrastructure/pagination_config.dart';

@Singleton()
class SearchedReposRemoteService extends ReposRemoteService {
  SearchedReposRemoteService({
    @Named('Core') required super.dio,
    required super.headersCache,
  });

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    String query,
    int page,
  ) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/search/repositories',
      {
        'q': query,
        'page': '$page',
        'per_page': PaginationConfig.itemsPerPage.toString(),
      },
    );
    return super.getPage(
      requestUri: requestUri,
      jsonDataSelector: (json) => json['items'] as List<dynamic>,
    );
  }
}
