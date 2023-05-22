import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_repo_viewer_oauth2/core/presentation/no_results_display.dart';
import 'package:github_repo_viewer_oauth2/core/presentation/toasts.dart';
import 'package:github_repo_viewer_oauth2/github/core/presentation/repo_card.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../repos/core/application/paginated_repos/paginated_repos_bloc.dart';
import 'failure_repo_tile.dart';
import 'loading_repo_tile.dart';

class PaginatedReposListView extends HookWidget {
  const PaginatedReposListView({
    super.key,
    required this.getNextPage,
    required this.noResultsMessage,
  });

  final void Function() getNextPage;
  final String noResultsMessage;

  @override
  Widget build(BuildContext context) {
    bool canLoadNextPage = useState(false).value;
    bool hasAlreadyShownNoConnectionToast = useState(false).value;

    return BlocConsumer<PaginatedReposBloc, PaginatedReposState>(
      listener: (context, state) {
        state.map(
          initial: (_) => canLoadNextPage = true,
          loadInProgress: (_) => canLoadNextPage = false,
          loadSuccess: (_) {
            if (!_.repos.isFresh && !hasAlreadyShownNoConnectionToast) {
              hasAlreadyShownNoConnectionToast = true;
              showNoConnectionToast(
                "No connection. Some information may be outdated",
                context,
              );
            }
            canLoadNextPage = _.isNextPageAvailable;
          },
          loadFailure: (_) => canLoadNextPage = false,
        );
      },
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            final metrics = notification.metrics;

            ///Next page is fetched when user reaches 2/3 of the visible content;
            final limit =
                metrics.maxScrollExtent - metrics.viewportDimension / 3;
            if (canLoadNextPage && metrics.pixels >= limit) getNextPage();
            return false;
          },
          child: state.maybeWhen(
            loadSuccess: (repos, _) => repos.entity.isEmpty,
            orElse: () => false,
          )
              ? NoResultsDisplay(
                  message: noResultsMessage,
                )
              : _PaginatedListView(state),
        );
      },
    );
  }
}

class _PaginatedListView extends StatelessWidget {
  const _PaginatedListView(this.state);

  final PaginatedReposState state;

  @override
  Widget build(BuildContext context) {
    final floatingSearchBar = FloatingSearchBar.of(context)?.widget;
    return ListView.builder(
      padding: floatingSearchBar == null
          ? EdgeInsets.zero
          : EdgeInsets.only(top: floatingSearchBar.height + 8.0),
      itemCount: state.map(
        initial: (_) => 0,
        loadInProgress: (_) => _.repos.entity.length + _.itemsPerPage,
        loadSuccess: (_) => _.repos.entity.length,
        loadFailure: (_) => _.repos.entity.length + 1,
      ),
      itemBuilder: (context, index) {
        return state.map(
          initial: (_) => Text('Initial'),
          loadInProgress: (_) {
            if (index < _.repos.entity.length) {
              return RepoCard(repo: _.repos.entity[index]);
            } else {
              return const LoadingRepoTile();
            }
          },
          loadSuccess: (_) => RepoCard(repo: _.repos.entity[index]),
          loadFailure: (_) {
            if (index < _.repos.entity.length) {
              return RepoCard(repo: _.repos.entity[index]);
            } else {
              return FailureRepoTile(failure: _.failure);
            }
          },
        );
      },
    );
  }
}
