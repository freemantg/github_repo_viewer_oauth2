part of 'paginated_repos_bloc.dart';

@freezed
class PaginatedReposEvent with _$PaginatedReposEvent {
  const PaginatedReposEvent._();
  const factory PaginatedReposEvent.getNextStarredReposPage() =
      _GetNextStarredReposPage;
  const factory PaginatedReposEvent.getNextSearchedReposPage(
      {required String query}) = _GetNextSearchedReposPage;
  const factory PaginatedReposEvent.getFirstStarredReposPage() =
      _GetFirstStarredReposPage;
  const factory PaginatedReposEvent.getFirstSearchedReposPage(
      {required String query}) = _GetFirstSearchedReposPage;
}
