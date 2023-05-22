import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/application/auth_bloc/auth_bloc.dart';
import '../../github/detail/application/bloc/repo_detail_bloc.dart';
import '../../github/repos/core/application/paginated_repos/paginated_repos_bloc.dart';
import '../../injection.dart';
import '../../search/application/cubit/cubit/search_history_cubit.dart';
import 'app_router.gr.dart';

class AppWidget extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<AuthBloc>()..add(AuthEvent.checkAndUpdateAuthStatus()),
        ),
        BlocProvider(
          create: (_) => getIt<PaginatedReposBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<SearchHistoryCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<RepoDetailBloc>(),
        )
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            authenticated: (_) {
              appRouter.pushAndPopUntil(
                StarredReposRoute(),
                predicate: (route) => false,
              );
            },
            unauthenticated: (_) {
              appRouter.pushAndPopUntil(
                SignInRoute(),
                predicate: (route) => false,
              );
            },
          );
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: _setUpThemeData(),
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
        ),
      ),
    );
  }

  // ThemeData _setUpThemeData() {
  //   return ThemeData(
  //     appBarTheme: AppBarTheme(
  //       elevation: 0,
  //       backgroundColor: Colors.transparent,
  //       foregroundColor: Colors.black87,
  //     ),
  //     scaffoldBackgroundColor: Color(0xFFF5F5F5),
  //     cardColor: Colors.white,
  //   );
  // }

  ThemeData _setUpThemeData() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF21252E),
      appBarTheme: AppBarTheme(color: Colors.transparent),
      cardColor: Color(0xFF212121),
    );
  }
}
