import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repo_viewer_oauth2/github/repos/searched_repos/infrastructure/searched_repos_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/fresh.dart';
import '../../../../core/domain/github_failure.dart';
import '../../../../core/domain/github_repo.dart';
import '../../../../core/infrastructure/pagination_config.dart';
import '../../../starred_repos/infrastructure/starred_repos_repository.dart';

part 'paginated_repos_event.dart';
part 'paginated_repos_state.dart';

part 'paginated_repos_bloc.freezed.dart';

typedef RepositoryGetter
    = Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> Function(int page);

@Injectable()
class PaginatedReposBloc
    extends Bloc<PaginatedReposEvent, PaginatedReposState> {
  final SearchedReposRepository _searchedReposRepository;
  final StarredReposRepository _starredReposRepository;

  int _page = 1;

  PaginatedReposBloc({
    required SearchedReposRepository searchedReposRepository,
    required StarredReposRepository starredReposRepository,
  })  : _searchedReposRepository = searchedReposRepository,
        _starredReposRepository = starredReposRepository,
        super(_Initial(Fresh.yes([]))) {
    on<PaginatedReposEvent>((event, emit) async {
      await event.map(
        getNextStarredReposPage: (_) async => await getNextPage(
          event,
          emit,
          (page) => _starredReposRepository.getStarredReposPage(page),
        ),
        getNextSearchedReposPage: (_) async {
          await getNextPage(
            event,
            emit,
            (page) =>
                _searchedReposRepository.getSearchedReposPage(_.query, page),
          );
        },
        getFirstStarredReposPage: (_) {
          _clear(emit);
          add(_GetNextStarredReposPage());
        },
        getFirstSearchedReposPage: (_) {
          _clear(emit);
          add(_GetNextSearchedReposPage(query: _.query));
        },
      );
    });
  }

  void _clear(Emitter<PaginatedReposState> emit) {
    _page = 1;
    emit(PaginatedReposState.initial(Fresh.yes([])));
  }

  Future<void> getNextPage(
    PaginatedReposEvent event,
    Emitter<PaginatedReposState> emit,
    RepositoryGetter getter,
  ) async {
    emit(PaginatedReposState.loadInProgress(
      state.repos,
      PaginationConfig.itemsPerPage,
    ));

    final failureOrRepos = await getter(_page);
    failureOrRepos.fold(
      (l) => emit(PaginatedReposState.loadFailure(state.repos, l)),
      (repos) {
        _page++;
        emit(
          PaginatedReposState.loadSuccess(
            repos.copyWith(
              entity: [
                ...state.repos.entity,
                ...repos.entity,
              ],
            ),
            isNextPageAvailable: repos.isNextPageAvailable ?? false,
          ),
        );
      },
    );
  }
}
