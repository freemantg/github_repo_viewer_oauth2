part of 'repo_detail_bloc.dart';

@freezed
class RepoDetailEvent with _$RepoDetailEvent {
  const factory RepoDetailEvent.getRepoDetail(String fullRepoName) = _GetRepoDetail;
  const factory RepoDetailEvent.switchStarredStatus(String fullRepoName) = _SwitchStarredStatus;
}