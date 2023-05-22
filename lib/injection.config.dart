// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'auth/application/auth_bloc/auth_bloc.dart' as _i19;
import 'auth/infrastructure/credentials_storage/credentials_storage.dart'
    as _i7;
import 'auth/infrastructure/credentials_storage/secure_credentials_storage.dart'
    as _i8;
import 'auth/infrastructure/github_authenticator.dart' as _i9;
import 'auth/infrastructure/oauth2_interceptor.dart' as _i20;
import 'auth/shared/injection_container.dart' as _i24;
import 'core/infrastructure/injection_container.dart' as _i26;
import 'core/infrastructure/sembast_data.dart' as _i5;
import 'github/core/infrastructure/github_headers_cache.dart' as _i10;
import 'github/detail/application/bloc/repo_detail_bloc.dart' as _i22;
import 'github/detail/infrastructure/repo_detail_local_service.dart' as _i11;
import 'github/detail/infrastructure/repo_detail_remote_service.dart' as _i12;
import 'github/detail/infrastructure/repo_detail_repository.dart' as _i13;
import 'github/repos/core/application/paginated_repos/paginated_repos_bloc.dart'
    as _i21;
import 'github/repos/searched_repos/infrastructure/searched_repos_remote_service.dart'
    as _i15;
import 'github/repos/searched_repos/infrastructure/searched_repos_repository.dart'
    as _i16;
import 'github/repos/shared/injection_container.dart' as _i25;
import 'github/repos/starred_repos/infrastructure/starred_repos_local_service.dart'
    as _i6;
import 'github/repos/starred_repos/infrastructure/starred_repos_remote_service.dart'
    as _i17;
import 'github/repos/starred_repos/infrastructure/starred_repos_repository.dart'
    as _i18;
import 'search/application/cubit/cubit/search_history_cubit.dart' as _i23;
import 'search/infrastructure/search_history_repository.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerAuthModule = _$RegisterAuthModule();
  final registerCoreModule = _$RegisterCoreModule();
  final registerGithubModule = _$RegisterGithubModule();
  final registerSembastDatabase = _$RegisterSembastDatabase();
  gh.lazySingleton<_i3.Dio>(
    () => registerAuthModule.dio,
    instanceName: 'Auth',
  );
  gh.lazySingleton<_i3.Dio>(
    () => registerCoreModule.dio,
    instanceName: 'Core',
  );
  gh.factory<_i4.FlutterSecureStorage>(
      () => registerGithubModule.secureStorage);
  gh.lazySingleton<_i5.SembastDatabase>(
      () => registerSembastDatabase.sembastDatabase);
  gh.factory<_i6.StarredReposLocalService>(() => _i6.StarredReposLocalService(
      sembastDatabase: get<_i5.SembastDatabase>()));
  gh.factory<_i7.CredentialsStorage>(() =>
      _i8.SecureCredentialsStorage(storage: get<_i4.FlutterSecureStorage>()));
  gh.lazySingleton<_i9.GithubAuthenticator>(() => _i9.GithubAuthenticator(
        credentialsStorage: get<_i7.CredentialsStorage>(),
        dio: get<_i3.Dio>(instanceName: 'Auth'),
      ));
  gh.factory<_i10.GithubHeadersCache>(() =>
      _i10.GithubHeadersCache(sembastDatabase: get<_i5.SembastDatabase>()));
  gh.factory<_i11.RepoDetailLocalService>(() => _i11.RepoDetailLocalService(
        sembastDatabase: get<_i5.SembastDatabase>(),
        headersCache: get<_i10.GithubHeadersCache>(),
      ));
  gh.factory<_i12.RepoDetailRemoteService>(() => _i12.RepoDetailRemoteService(
        dio: get<_i3.Dio>(instanceName: 'Core'),
        headersCache: get<_i10.GithubHeadersCache>(),
      ));
  gh.factory<_i13.RepoDetailRepository>(() => _i13.RepoDetailRepository(
        localService: get<_i11.RepoDetailLocalService>(),
        remoteService: get<_i12.RepoDetailRemoteService>(),
      ));
  gh.factory<_i14.SearchHistoryRepository>(
      () => _i14.SearchHistoryRepository(get<_i5.SembastDatabase>()));
  gh.singleton<_i15.SearchedReposRemoteService>(_i15.SearchedReposRemoteService(
    dio: get<_i3.Dio>(instanceName: 'Core'),
    headersCache: get<_i10.GithubHeadersCache>(),
  ));
  gh.factory<_i16.SearchedReposRepository>(() =>
      _i16.SearchedReposRepository(get<_i15.SearchedReposRemoteService>()));
  gh.singleton<_i17.StarredReposRemoteService>(_i17.StarredReposRemoteService(
    dio: get<_i3.Dio>(instanceName: 'Core'),
    headersCache: get<_i10.GithubHeadersCache>(),
  ));
  gh.factory<_i18.StarredReposRepository>(() => _i18.StarredReposRepository(
        remoteService: get<_i17.StarredReposRemoteService>(),
        localService: get<_i6.StarredReposLocalService>(),
      ));
  gh.factory<_i19.AuthBloc>(
      () => _i19.AuthBloc(authenticator: get<_i9.GithubAuthenticator>()));
  gh.singleton<_i3.Interceptor>(_i20.OAuth2Interceptor(
    authenticator: get<_i9.GithubAuthenticator>(),
    authBloc: get<_i19.AuthBloc>(),
    dio: get<_i3.Dio>(instanceName: 'Auth'),
  ));
  gh.factory<_i21.PaginatedReposBloc>(() => _i21.PaginatedReposBloc(
        searchedReposRepository: get<_i16.SearchedReposRepository>(),
        starredReposRepository: get<_i18.StarredReposRepository>(),
      ));
  gh.factory<_i22.RepoDetailBloc>(
      () => _i22.RepoDetailBloc(repository: get<_i13.RepoDetailRepository>()));
  gh.factory<_i23.SearchHistoryCubit>(
      () => _i23.SearchHistoryCubit(get<_i14.SearchHistoryRepository>()));
  return get;
}

class _$RegisterAuthModule extends _i24.RegisterAuthModule {}

class _$RegisterCoreModule extends _i25.RegisterCoreModule {}

class _$RegisterGithubModule extends _i24.RegisterGithubModule {}

class _$RegisterSembastDatabase extends _i26.RegisterSembastDatabase {}
