import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer_oauth2/github/repos/core/application/paginated_repos/paginated_repos_bloc.dart';

import '../domain/github_failure.dart';

class FailureRepoTile extends StatelessWidget {
  final GithubFailure failure;
  const FailureRepoTile({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: Theme.of(context).colorScheme.onError,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        color: Theme.of(context).errorColor,
        child: ListTile(
          title: Text(
            'An error occured, please, retry',
          ),
          subtitle: Text(
            failure.map(api: (_) => 'API returned ${failure.errorCode}'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          leading: SizedBox(
            height: double.infinity,
            child: Icon(Icons.warning),
          ),
          trailing: IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => context
                .read<PaginatedReposBloc>()
                .add(PaginatedReposEvent.getNextStarredReposPage()),
          ),
        ),
      ),
    );
  }
}
