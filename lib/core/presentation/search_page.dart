import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer_oauth2/search/presentation/search_bar.dart';

import '../../github/repos/core/application/paginated_repos/paginated_repos_bloc.dart';
import 'app_router.gr.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar(
          title: 'Search Github',
          onShouldNavigateToResultPage: (searchTerm) {
            AutoRouter.of(context)
                .push(SearchedReposRoute(searchTerm: searchTerm))
                .then(
                  (_) => context
                      .read<PaginatedReposBloc>()
                      .add(PaginatedReposEvent.getFirstStarredReposPage()),
                );
          },
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Find your stuff.',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Search all of GitHub for Repositories.',
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
