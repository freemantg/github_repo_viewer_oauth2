import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../auth/application/auth_bloc/auth_bloc.dart';
import '../../../../core/presentation/app_router.gr.dart';
import '../../../core/presentation/paginated_repos_list_view.dart';
import '../../core/application/paginated_repos/paginated_repos_bloc.dart';

class StarredReposPage extends StatefulWidget {
  const StarredReposPage({super.key});

  @override
  State<StarredReposPage> createState() => _StarredReposPageState();
}

class _StarredReposPageState extends State<StarredReposPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<PaginatedReposBloc>()
          .add(PaginatedReposEvent.getFirstStarredReposPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => context.read<AuthBloc>().add(AuthEvent.signOut())),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.githubAlt),
            SizedBox(width: 8.0),
            Text(
              'Your ',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Feed',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => AutoRouter.of(context).push(SearchRoute()),
            icon: Icon(Icons.search),
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SafeArea(
          child: PaginatedReposListView(
            getNextPage: () => context
                .read<PaginatedReposBloc>()
                .add(PaginatedReposEvent.getNextStarredReposPage()),
            noResultsMessage:
                "That's about everything we could find in your starred repos right now",
          ),
        ),
      ),
    );
  }
}
