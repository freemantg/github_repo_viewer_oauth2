import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_viewer_oauth2/github/core/domain/github_repo.dart';
import 'package:github_repo_viewer_oauth2/github/core/shared/extensions.dart';
import 'package:github_repo_viewer_oauth2/github/detail/application/bloc/repo_detail_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../core/presentation/app_router.gr.dart';

class RepoCard extends StatelessWidget {
  final GithubRepo repo;

  const RepoCard({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(RepoDetailRoute(repo: repo)),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Hero(
                    tag: repo.fullName,
                    child: CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(repo.owner.avatarUrlSmall),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      repo.fullName,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    formatDateTimeToTimeAgo(repo.updatedAt),
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              Divider(),
              Text(
                repo.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 4.0),
              Text(
                repo.description,
                maxLines: 3,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(height: 1.5),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 12.0),
              Row(
                children: [
                  LanguageChip(repo),
                  Icon(
                    Icons.star,
                    color: Color(0xFFFBCB3E),
                    size: 16.0,
                  ),
                  SizedBox(width: 2.0),
                  Text(
                    repo.stargazersCount.formattedNumber,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(width: 8.0),
                  Icon(
                    MdiIcons.sourceFork,
                    color: Colors.grey.shade500,
                    size: 16.0,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    repo.forksCount.formattedNumber,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Spacer(),
                  StarButton(repo: repo)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageChip extends StatelessWidget {
  final GithubRepo repo;
  const LanguageChip(this.repo, {super.key});

  @override
  Widget build(BuildContext context) {
    if (repo.language.isNotEmpty) {
      return Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: repo.languageColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 8,
            width: 8,
          ),
          SizedBox(width: 4.0),
          Text(
            repo.language,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(width: 8.0),
        ],
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

extension NumberFormatterX on int {
  String get formattedNumber => NumberFormat().format(this);
}

class StarButton extends StatefulWidget {
  final GithubRepo repo;
  const StarButton({
    super.key,
    required this.repo,
  });

  @override
  State<StarButton> createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  @override
  void initState() {
    super.initState();
    context
        .read<RepoDetailBloc>()
        .add(RepoDetailEvent.getRepoDetail(widget.repo.fullName));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoDetailBloc, RepoDetailState>(
      builder: (_, state) {
        return state.maybeMap(
          loadSuccess: (_) {
            final isStarred = _.repoDetail.entity?.starred ?? false;
            return Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: isStarred
                    ? Colors.yellow.withOpacity(0.1)
                    : Colors.grey.shade400.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: isStarred ? Color(0xFFFBCB3E) : Colors.grey.shade400,
                    size: 18.0,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    'Star',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: isStarred
                              ? Color(0xFFFBCB3E)
                              : Colors.grey.shade400,
                        ),
                  ),
                ],
              ),
            );
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
