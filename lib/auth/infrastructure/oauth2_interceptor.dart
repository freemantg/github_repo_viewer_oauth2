import 'package:dio/dio.dart';
import 'package:github_repo_viewer_oauth2/auth/infrastructure/github_authenticator.dart';
import 'package:injectable/injectable.dart';

import '../application/auth_bloc/auth_bloc.dart';

@Singleton(as: Interceptor)
class OAuth2Interceptor extends Interceptor {
  final GithubAuthenticator _authenticator;
  final AuthBloc _authBloc;
  final Dio _dio;

  OAuth2Interceptor({
    required GithubAuthenticator authenticator,
    required AuthBloc authBloc,
    @Named('Auth') required Dio dio,
  })  : _authenticator = authenticator,
        _authBloc = authBloc,
        _dio = dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final credentials = await _authenticator.getSignedInCredentials();
    final modifiedOptions = options
      ..headers.addAll(
        credentials == null
            ? {}
            : {'Authorization': 'bearer ${credentials.accessToken}'},
      );
    handler.next(modifiedOptions);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final errorResponse = err.response;
    if (errorResponse != null && errorResponse.statusCode == 401) {
      final credentials = await _authenticator.getSignedInCredentials();
      credentials != null && credentials.canRefresh
          ? await _authenticator.refresh(credentials)
          : await _authenticator.clearCredentialsStorage();
      _authBloc.add(AuthEvent.checkAndUpdateAuthStatus());

      //Reattempting the response with refreshed credentials
      final refreshedCredentials =
          await _authenticator.getSignedInCredentials();
      if (refreshedCredentials != null) {
        handler.resolve(
          await _dio.fetch(
            errorResponse.requestOptions
              ..headers['Authorization'] =
                  'bearer ${refreshedCredentials.accessToken}',
          ),
        );
      }
    }
  }
}
