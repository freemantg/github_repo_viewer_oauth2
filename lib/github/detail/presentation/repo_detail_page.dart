import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer_oauth2/core/presentation/no_results_display.dart';
import 'package:github_repo_viewer_oauth2/core/presentation/toasts.dart';
import 'package:github_repo_viewer_oauth2/github/repos/core/application/paginated_repos/paginated_repos_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../../core/domain/github_repo.dart';
import '../application/bloc/repo_detail_bloc.dart';
import 'css.dart';

class RepoDetailPage extends StatefulWidget {
  final GithubRepo repo;

  const RepoDetailPage({super.key, required this.repo});

  @override
  State<RepoDetailPage> createState() => _RepoDetailPageState();
}

class _RepoDetailPageState extends State<RepoDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context
          .read<RepoDetailBloc>()
          .add(RepoDetailEvent.getRepoDetail(widget.repo.fullName)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RepoDetailBloc, RepoDetailState>(
      listener: (context, state) {
        state.maybeWhen(
          loadSuccess: (repoDetail, _) {
            if (!repoDetail.isFresh) {
              showNoConnectionToast(
                "You're not online. Some information may be outdated",
                context,
              );
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (_) {
            return WillPopScope(
              onWillPop: () async {
                if (state.hasStarredStatusChanged) {
                  context
                      .read<PaginatedReposBloc>()
                      .add(PaginatedReposEvent.getFirstStarredReposPage());
                }
                return true;
              },
              child: Scaffold(
                appBar: AppBar(
                  title: Row(
                    children: [
                      Hero(
                        tag: widget.repo.fullName,
                        child: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            widget.repo.owner.avatarUrlSmall,
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          widget.repo.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  actions: [
                    state.maybeMap(
                      orElse: () => Shimmer.fromColors(
                        baseColor: Colors.grey.shade400,
                        highlightColor: Colors.grey.shade300,
                        child: IconButton(
                          icon: Icon(Icons.star),
                          disabledColor: Theme.of(context).iconTheme.color,
                          onPressed: null,
                        ),
                      ),
                      loadSuccess: (state) {
                        return IconButton(
                          color: state.repoDetail.entity?.starred ?? false
                              ? Color(0xFFFBCB3E)
                              : Colors.grey.shade400,
                          icon: Icon(
                            !state.repoDetail.isFresh
                                ?
                                //No Internet Icon
                                MdiIcons.starRemoveOutline
                                : state.repoDetail.entity?.starred == true
                                    ? Icons.star
                                    : Icons.star_outline,
                          ),
                          onPressed: !state.repoDetail.isFresh
                              ? null
                              : () {
                                  context.read<RepoDetailBloc>().add(
                                        RepoDetailEvent.switchStarredStatus(
                                            state.repoDetail.entity!.fullName),
                                      );
                                },
                        );
                      },
                    )
                  ],
                ),
                body: state.map(
                  initial: (_) => SizedBox.shrink(),
                  loadInProgress: (_) =>
                      Center(child: CircularProgressIndicator()),
                  loadSuccess: (_) {
                    if (_.repoDetail.entity == null) {
                      return NoResultsDisplay(
                        message:
                            'This is all the details we could find right now',
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: WebView(
                            javascriptMode: JavascriptMode.unrestricted,
                            navigationDelegate: (navigation) {
                              if (navigation.url.startsWith('data:')) {
                                return NavigationDecision.navigate;
                              } else {
                                url_launcher
                                    .launchUrl(Uri.parse(navigation.url));
                                return NavigationDecision.prevent;
                              }
                            },
                            initialUrl: Uri.dataFromString(
                              '''
                                          <html>
                                          <head>
                                          <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                          </head>
                                          <body>${_.repoDetail.entity?.html}</body>
                                          </html>
                                          $css
                                          ''',
                              mimeType: 'text/html',
                              encoding: Encoding.getByName('utf-8'),
                            ).toString(),
                          ),
                        ),
                      );
                    }
                  },
                  loadFailure: (_) => Center(child: Text(_.failure.toString())),
                ),
              ),
            );
          },
          loadFailure: (_) => Text('Failure'),
          orElse: () {
            return Scaffold(
              body: SafeArea(child: Text('Failure')),
            );
          },
        );
      },
    );
  }
}
