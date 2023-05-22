import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:github_repo_riverpod/auth/domain/auth_failure.dart';
import 'package:github_repo_riverpod/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:github_repo_riverpod/core/shared/encoders.dart';
import 'package:oauth2/oauth2.dart';
import 'package:http/http.dart' as http;
import 'package:github_repo_riverpod/core/infrastructure/dio_extension.dart';

//2. By default github response is NOT json -> Add to the header 'Accept' then pass in the grant to use.
class GithubOAuthHttpClient extends http.BaseClient {
  final httpClient = http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return httpClient.send(request);
  }
}

class GithubAuthenticator {
  final CredentialsStorage _credentialsStorage;
  final Dio _dio;

  GithubAuthenticator(this._credentialsStorage, this._dio);

//Use oauth2 documentation to know which fields to create https://pub.dev/packages/oauth2; https://docs.github.com/en/developers/apps/building-oauth-apps/authorizing-oauth-apps

//This will handle 1. Request a user's GitHub identity
  static const clientId = 'ADD CLIENT ID';
  static const clientSecret = 'ADD CLIENT SECRET';
  static final authorizationEndpoint =
      Uri.parse('https://github.com/login/oauth/authorize');
  static final tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');
  static final redirectUrl = Uri.parse('ADD CALLBACK URL');
  static final revocationEndpoint =
      Uri.parse('https://api.github.com/applications/$clientId/token');
  static const scopes = ['read:user', 'repo'];

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialsStorage.read();

      if (storedCredentials != null) {
        if (storedCredentials.canRefresh && storedCredentials.isExpired) {
          final failureOrCredentials = await refresh(storedCredentials);
          //If refreshed() returns a AuthFailure, we return a null. Otherwise we return the refreshed credentials.
          return failureOrCredentials.fold((l) => null, (r) => r);
        }
        return storedCredentials;
      }
    } on PlatformException {
      return null;
    }
  }

  // If we don't have OAuth2 credentials yet, we need to get the resource owner
  // to authorize us. We're assuming here that we're a command-line application.
  AuthorizationCodeGrant createGrant() {
    return AuthorizationCodeGrant(
      clientId,
      authorizationEndpoint,
      tokenEndpoint,
      secret: clientSecret,
      httpClient: GithubOAuthHttpClient(),
    );
  }

// A URL on the authorization server (authorizationEndpoint with some additional
  // query parameters). Scopes and state can optionally be passed into this method.
  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(
      redirectUrl,
      scopes: scopes,
    );
  }

  //This handles If the user accepts your request, GitHub redirects back to your site with a temporary code in a code parameter as well as the state you provided in the previous step in a state parameter. The temporary code will expire after 10 minutes. The code is stored in the parameters 'code';

  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    //These params will be present in the redirect URL
    Map<String, String> queryParams,
  ) async {
    try {
      //This will contain the code token -> this runs 2. Exchange this code for an access token: POST https://github.com/login/oauth/access_token
      final httpClient = await grant.handleAuthorizationResponse(queryParams);
      //This includes the access token.
      await _credentialsStorage.save(httpClient.credentials);
      return right(unit);
    } on FormatException catch (e) {
      print(e.message);
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      print(e.error);
      return left(AuthFailure.server(message: '${e.error} : ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<bool> isSignedIn() => getSignedInCredentials().then(
        (credentials) => credentials != null,
      );

  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      final accessToken = await _credentialsStorage
          .read()
          .then((credentials) => credentials?.accessToken);

      final usernameAndPassword =
          stringToBase64.encode('$clientId:$clientSecret');

      await _dio.deleteUri(
        revocationEndpoint,
        //Passing in the parameters 'access_token' as required by Github
        data: {'access_token': accessToken},
        options: Options(
          headers: {'Authorization': 'basic $usernameAndPassword'},
        ),
      );
      return clearCredentialsStorage();
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return clearCredentialsStorage();
      } else {
        rethrow;
      }
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> clearCredentialsStorage() async {
    try {
      await _credentialsStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Credentials>> refresh(
      Credentials credentials) async {
    try {
      final refreshedCredentials = await credentials.refresh(
          // identifier: clientId,
          // secret: clientSecret,
          // httpClient: GithubOAuthHttpClient(),
          );
      //Ensuring we cache the newly refreshed credentials;
      await _credentialsStorage.save(refreshedCredentials);
      return right(refreshedCredentials);
    } on PlatformException {
      return left(const AuthFailure.storage());
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server(message: '${e.error}: ${e.description}'));
    }
  }
}
