import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer_oauth2/core/presentation/app_router.gr.dart';
import 'package:github_repo_viewer_oauth2/github/repos/core/application/paginated_repos/paginated_repos_bloc.dart';

import '../../../../search/presentation/search_bar.dart';
import '../../../core/presentation/paginated_repos_list_view.dart';

class SearchedReposPage extends StatefulWidget {
  final String searchTerm;

  const SearchedReposPage({
    super.key,
    required this.searchTerm,
  });

  @override
  State<SearchedReposPage> createState() => _SearchedReposPageState();
}

class _SearchedReposPageState extends State<SearchedReposPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        context.read<PaginatedReposBloc>()
          ..add(PaginatedReposEvent.getFirstSearchedReposPage(
              query: widget.searchTerm));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar(
          title: widget.searchTerm,
          onShouldNavigateToResultPage: (searchTerm) {
            AutoRouter.of(context).pushAndPopUntil(
              SearchedReposRoute(searchTerm: searchTerm),
              predicate: (route) =>
                  route.settings.name == StarredReposRoute.name,
            );
          },
          body: PaginatedReposListView(
            getNextPage: () => context.read<PaginatedReposBloc>().add(
                PaginatedReposEvent.getNextSearchedReposPage(
                    query: widget.searchTerm)),
            noResultsMessage: "This is all we could find for your search term.",
          ),
        ),
      ),
    );
  }
}
