import 'package:dio/dio.dart';
import 'package:github_repo_viewer_oauth2/core/infrastructure/dio_extensions.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/infrastructure/network_exceptions.dart';
import '../../../../core/infrastructure/remote_response.dart';
import '../../../core/github_headers.dart';
import '../../../core/infrastructure/github_headers_cache.dart';
import '../../../core/infrastructure/github_repo_dto.dart';

abstract class ReposRemoteService {
  final Dio _dio;
  final GithubHeadersCache _headersCache;

  ReposRemoteService({
    @Named('Core') required Dio dio,
    required GithubHeadersCache headersCache,
  })  : _dio = dio,
        _headersCache = headersCache;

  Future<RemoteResponse<List<GithubRepoDTO>>> getPage({
    required Uri requestUri,
    //Allows the casting of Json data to match w/ Searched/Starred.
    required List<dynamic> Function(dynamic json) jsonDataSelector,
  }) async {
    //Grabbing eTag of previous cached headers and passing through headers.
    final previousHeaders = await _headersCache.getHeaders(requestUri);

    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {'If-None-Match': previousHeaders?.eTag ?? ''},
        ),
      );
      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
          maxPage: previousHeaders?.link?.maxPage ?? 0,
        );
      }
      if (response.statusCode == 200) {
        //Caching Headers
        final headers = GithubHeaders.parse(response);
        await _headersCache.saveHeaders(requestUri, headers);

        final convertedData = jsonDataSelector(response.data)
            .map((e) => GithubRepoDTO.fromJson(e as Map<String, dynamic>))
            .toList();
        return RemoteResponse.withNewData(
          convertedData,
          maxPage: previousHeaders?.link?.maxPage ?? 1,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
