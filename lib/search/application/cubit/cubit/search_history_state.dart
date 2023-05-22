part of 'search_history_cubit.dart';

@freezed
class SearchHistoryState with _$SearchHistoryState {
  const factory SearchHistoryState.initial() = _Initial;
  const factory SearchHistoryState.loadInProgress() = _LoadInProgress;
  const factory SearchHistoryState.loadSuccess(
      {required List<String> searchTerms}) = _LoadSuccess;
  const factory SearchHistoryState.loadFailure(String message) = _Failure;
}
