import 'package:dio/dio.dart';
import 'package:github_repo_viewer_oauth2/github/core/infrastructure/pagination_config.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/infrastructure/remote_response.dart';
import '../../../core/infrastructure/github_headers_cache.dart';
import '../../../core/infrastructure/github_repo_dto.dart';
import '../../core/infrastructure/repos_remote_service.dart';

@Singleton()
class StarredReposRemoteService extends ReposRemoteService {
  StarredReposRemoteService({
    @Named('Core') required Dio dio,
    required GithubHeadersCache headersCache,
  }) : super(dio: dio, headersCache: headersCache);

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredReposPage(
    int page,
  ) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/user/starred',
      {
        'page': '$page',
        'per_page': PaginationConfig.itemsPerPage.toString(),
      },
    );
    return super.getPage(
        requestUri: requestUri,
        jsonDataSelector: (json) => json as List<dynamic>);
  }
}
