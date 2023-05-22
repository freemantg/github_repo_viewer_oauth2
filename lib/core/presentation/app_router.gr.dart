// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../auth/presentation/authorization_page.dart' as _i5;
import '../../auth/presentation/sign_in_page.dart' as _i2;
import '../../github/core/domain/github_repo.dart' as _i10;
import '../../github/detail/presentation/repo_detail_page.dart' as _i7;
import '../../github/repos/searched_repos/presentation/searched_repos_page.dart'
    as _i6;
import '../../github/repos/starred_repos/presentation/starred_repos_page.dart'
    as _i3;
import '../../splash/presentation/splash_page.dart' as _i1;
import 'search_page.dart' as _i4;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignInPage(),
      );
    },
    StarredReposRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.StarredReposPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SearchPage(),
      );
    },
    AuthorizationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthorizationRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.AuthorizationPage(
          key: args.key,
          authorizationUrl: args.authorizationUrl,
          onAuthorizationCodeRedirectAttempt:
              args.onAuthorizationCodeRedirectAttempt,
        ),
      );
    },
    SearchedReposRoute.name: (routeData) {
      final args = routeData.argsAs<SearchedReposRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.SearchedReposPage(
          key: args.key,
          searchTerm: args.searchTerm,
        ),
      );
    },
    RepoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RepoDetailRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.RepoDetailPage(
          key: args.key,
          repo: args.repo,
        ),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          SignInRoute.name,
          path: '/sign-in',
        ),
        _i8.RouteConfig(
          StarredReposRoute.name,
          path: 'starred',
        ),
        _i8.RouteConfig(
          SearchRoute.name,
          path: '/search',
        ),
        _i8.RouteConfig(
          AuthorizationRoute.name,
          path: '/auth',
        ),
        _i8.RouteConfig(
          SearchedReposRoute.name,
          path: '/searched',
        ),
        _i8.RouteConfig(
          RepoDetailRoute.name,
          path: '/detail',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.StarredReposPage]
class StarredReposRoute extends _i8.PageRouteInfo<void> {
  const StarredReposRoute()
      : super(
          StarredReposRoute.name,
          path: 'starred',
        );

  static const String name = 'StarredReposRoute';
}

/// generated route for
/// [_i4.SearchPage]
class SearchRoute extends _i8.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '/search',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i5.AuthorizationPage]
class AuthorizationRoute extends _i8.PageRouteInfo<AuthorizationRouteArgs> {
  AuthorizationRoute({
    _i9.Key? key,
    required Uri authorizationUrl,
    required void Function(Uri) onAuthorizationCodeRedirectAttempt,
  }) : super(
          AuthorizationRoute.name,
          path: '/auth',
          args: AuthorizationRouteArgs(
            key: key,
            authorizationUrl: authorizationUrl,
            onAuthorizationCodeRedirectAttempt:
                onAuthorizationCodeRedirectAttempt,
          ),
        );

  static const String name = 'AuthorizationRoute';
}

class AuthorizationRouteArgs {
  const AuthorizationRouteArgs({
    this.key,
    required this.authorizationUrl,
    required this.onAuthorizationCodeRedirectAttempt,
  });

  final _i9.Key? key;

  final Uri authorizationUrl;

  final void Function(Uri) onAuthorizationCodeRedirectAttempt;

  @override
  String toString() {
    return 'AuthorizationRouteArgs{key: $key, authorizationUrl: $authorizationUrl, onAuthorizationCodeRedirectAttempt: $onAuthorizationCodeRedirectAttempt}';
  }
}

/// generated route for
/// [_i6.SearchedReposPage]
class SearchedReposRoute extends _i8.PageRouteInfo<SearchedReposRouteArgs> {
  SearchedReposRoute({
    _i9.Key? key,
    required String searchTerm,
  }) : super(
          SearchedReposRoute.name,
          path: '/searched',
          args: SearchedReposRouteArgs(
            key: key,
            searchTerm: searchTerm,
          ),
        );

  static const String name = 'SearchedReposRoute';
}

class SearchedReposRouteArgs {
  const SearchedReposRouteArgs({
    this.key,
    required this.searchTerm,
  });

  final _i9.Key? key;

  final String searchTerm;

  @override
  String toString() {
    return 'SearchedReposRouteArgs{key: $key, searchTerm: $searchTerm}';
  }
}

/// generated route for
/// [_i7.RepoDetailPage]
class RepoDetailRoute extends _i8.PageRouteInfo<RepoDetailRouteArgs> {
  RepoDetailRoute({
    _i9.Key? key,
    required _i10.GithubRepo repo,
  }) : super(
          RepoDetailRoute.name,
          path: '/detail',
          args: RepoDetailRouteArgs(
            key: key,
            repo: repo,
          ),
        );

  static const String name = 'RepoDetailRoute';
}

class RepoDetailRouteArgs {
  const RepoDetailRouteArgs({
    this.key,
    required this.repo,
  });

  final _i9.Key? key;

  final _i10.GithubRepo repo;

  @override
  String toString() {
    return 'RepoDetailRouteArgs{key: $key, repo: $repo}';
  }
}
