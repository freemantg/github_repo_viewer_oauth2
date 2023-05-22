import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:github_repo_viewer_oauth2/core/infrastructure/dio_extensions.dart';
import 'package:github_repo_viewer_oauth2/core/infrastructure/network_exceptions.dart';
import 'package:github_repo_viewer_oauth2/github/core/github_headers.dart';
import 'package:github_repo_viewer_oauth2/github/core/infrastructure/github_headers_cache.dart';
import 'package:injectable/injectable.dart';

import '../../../core/infrastructure/remote_response.dart';

@Injectable()
class RepoDetailRemoteService {
  final Dio _dio;
  final GithubHeadersCache _headersCache;

  RepoDetailRemoteService({
    @Named('Core') required Dio dio,
    required GithubHeadersCache headersCache,
  })  : _dio = dio,
        _headersCache = headersCache;

  Future<RemoteResponse<String>> getReadmeHtml(String fullRepoName) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/repos/$fullRepoName/readme',
    );
    final previousHeaders = await _headersCache.getHeaders(requestUri);

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {
            'If-None-Match': previousHeaders?.eTag ?? '',
          },
          responseType: ResponseType.plain,
        ),
      );
      if (response.statusCode == 304) {
        return RemoteResponse.notModified(maxPage: 0);
      } else if (response.statusCode == 200) {
        final headers = GithubHeaders.parse(response);
        await _headersCache.saveHeaders(requestUri, headers);

        final html = response.data as String;
        return RemoteResponse.withNewData(html, maxPage: 0);
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      }
      {
        rethrow;
      }
    }
  }

  /// Returns 'null' if there's no Internet connection
  Future<bool?> getStarredStatus(String fullRepoName) async {
    final requestUri =
        Uri.https('api.github.com', '/user/starred/$fullRepoName');
    try {
      final response = await _dio.requestUri(
        requestUri,
        options: Options(
          validateStatus: (status) =>
              (status != null && status >= 200 && status < 400) ||
              status == 404,
        ),
      );
      if (response.statusCode == 204) {
        return true;
      } else if (response.statusCode == 404) {
        return false;
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return null;
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      }
      {
        rethrow;
      }
    }
  }

  ///Returns 'null' if there's no Internet Connection.
  Future<Unit?> switchStarredStatus(
    String fullRepoName, {
    required bool isCurrentlyStarred,
  }) async {
    final requestUri = Uri.https(
      'api.github.com',
      '/user/starred/$fullRepoName',
    );

    try {
      final response = await (isCurrentlyStarred
          ? _dio.deleteUri(requestUri)
          : _dio.putUri(requestUri));

      if (response.statusCode == 204) {
        return unit;
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return null;
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
