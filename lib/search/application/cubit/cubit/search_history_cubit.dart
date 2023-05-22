import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repo_viewer_oauth2/search/infrastructure/search_history_repository.dart';
import 'package:injectable/injectable.dart';

part 'search_history_state.dart';
part 'search_history_cubit.freezed.dart';

@Injectable()
class SearchHistoryCubit extends Cubit<SearchHistoryState> {
  final SearchHistoryRepository _repository;
  SearchHistoryCubit(this._repository) : super(SearchHistoryState.initial());

  void watchSearchTerms({String? filter}) {
    emit(SearchHistoryState.loadInProgress());
    final stream = _repository.watchSearchTerms(filter: filter);
    stream.listen(
      (searchTerms) =>
          emit(SearchHistoryState.loadSuccess(searchTerms: searchTerms)),
      onError: (error) =>
          emit(SearchHistoryState.loadFailure(error.toString())),
    );
  }

  Future<void> putSearchTermFirst(String term) async =>
      await _repository.putSearchTermFirst(term);

  Future<void> addSearchTerm(String term) async =>
      await _repository.addSearchTerm(term);

  Future<void> deleteSearchTerm(String term) async =>
      await _repository.deleteSearchTerm(term);
}
