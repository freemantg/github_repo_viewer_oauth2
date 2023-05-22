part of 'repo_detail_bloc.dart';

@freezed
class RepoDetailState with _$RepoDetailState {
  const factory RepoDetailState.initial({
    @Default(false) bool hasStarredStatusChanged,
  }) = _Initial;
  const factory RepoDetailState.loadInProgress({
    @Default(false) bool hasStarredStatusChanged,
  }) = _LoadInProgress;
  const factory RepoDetailState.loadSuccess(
    Fresh<GithubRepoDetail?> repoDetail, {
    @Default(false) bool hasStarredStatusChanged,
  }) = _LoadSuccess;
  const factory RepoDetailState.loadFailure(
    GithubFailure failure, {
    @Default(false) bool hasStarredStatusChanged,
  }) = _Failure;
}
