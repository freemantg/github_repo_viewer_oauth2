import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../application/cubit/cubit/search_history_cubit.dart';

class SearchBar extends StatefulWidget {
  final String title;
  final Widget body;
  final void Function(String searchTerm) onShouldNavigateToResultPage;

  const SearchBar({
    super.key,
    required this.title,
    required this.body,
    required this.onShouldNavigateToResultPage,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late FloatingSearchBarController _controller;

  @override
  void initState() {
    _controller = FloatingSearchBarController();
    super.initState();
    Future.microtask(
      () => context.read<SearchHistoryCubit>().watchSearchTerms(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void pushPageAndPutFirstInHistory(String searchTerm) {
      widget.onShouldNavigateToResultPage(searchTerm);
      context.read<SearchHistoryCubit>().putSearchTermFirst(searchTerm);
      _controller.close();
    }

    void pushPageAndAddToHistory(String searchTerm) {
      widget.onShouldNavigateToResultPage(searchTerm);
      context.read<SearchHistoryCubit>().addSearchTerm(searchTerm);
      _controller.close();
    }

    return FloatingSearchBar(
      margins: EdgeInsets.all(12.0),
      borderRadius: BorderRadius.circular(8.0),
      controller: _controller,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      automaticallyImplyBackButton: false,
      body: FloatingSearchBarScrollNotifier(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
          child: widget.body,
        ),
      ),
      onSubmitted: (query) => pushPageAndAddToHistory(query),
      onQueryChanged: (query) =>
          context.read<SearchHistoryCubit>().watchSearchTerms(filter: query),
      leadingActions: [
        if (AutoRouter.of(context).canPop() &&
            (Platform.isIOS || Platform.isMacOS))
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            splashRadius: 18.0,
            onPressed: () => AutoRouter.of(context).pop(),
          )
        else if (AutoRouter.of(context).canPop())
          IconButton(
            icon: Icon(Icons.arrow_back),
            splashRadius: 18.0,
            onPressed: () => AutoRouter.of(context).pop(),
          )
      ],
      actions: [
        FloatingSearchBarAction.searchToClear(showIfClosed: false),
      ],
      builder: (context, transition) {
        return Material(
          elevation: 4.0,
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.0),
          clipBehavior: Clip.hardEdge,
          child: BlocBuilder<SearchHistoryCubit, SearchHistoryState>(
            builder: (BuildContext context, state) {
              return state.maybeMap(
                loadSuccess: (state) {
                  if (_controller.query.isEmpty && state.searchTerms.isEmpty) {
                    return SizedBox.shrink();
                  } else if (state.searchTerms.isEmpty) {
                    return ListTile(
                      title: Text(_controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () =>
                          pushPageAndPutFirstInHistory(_controller.query),
                    );
                  }
                  return Column(
                    children: state.searchTerms
                        .map((term) => ListTile(
                              title: Text(
                                term,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: Icon(Icons.history),
                              trailing: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () => context
                                    .read<SearchHistoryCubit>()
                                    .deleteSearchTerm(term),
                              ),
                              onTap: () => pushPageAndPutFirstInHistory(term),
                            ))
                        .toList(),
                  );
                },
                orElse: () => ListTile(
                  title: Text('An error occurred'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
