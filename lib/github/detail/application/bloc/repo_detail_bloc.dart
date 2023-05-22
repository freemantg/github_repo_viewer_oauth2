import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repo_viewer_oauth2/github/core/domain/github_failure.dart';
import 'package:github_repo_viewer_oauth2/github/detail/domain/github_repo_detail.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/fresh.dart';
import '../../infrastructure/repo_detail_repository.dart';

part 'repo_detail_event.dart';
part 'repo_detail_state.dart';
part 'repo_detail_bloc.freezed.dart';

@Injectable()
class RepoDetailBloc extends Bloc<RepoDetailEvent, RepoDetailState> {
  final RepoDetailRepository _repository;

  RepoDetailBloc({required RepoDetailRepository repository})
      : _repository = repository,
        super(_Initial()) {
    on<RepoDetailEvent>(
      (event, emit) async {
        await event.when(
          getRepoDetail: (fullRepoName) =>
              getRepoDetail(emit, fullRepoName: fullRepoName),
          switchStarredStatus: (fullRepoName) =>
              switchStarredStatus(emit, fullRepoName: fullRepoName),
        );
      },
    );
  }

  Future<void> getRepoDetail(Emitter<RepoDetailState> emit,
      {required String fullRepoName}) async {
    final failureOrRepoDetail = await _repository.getRepoDetail(fullRepoName);
    failureOrRepoDetail.fold(
      (l) => emit(RepoDetailState.loadFailure(l)),
      (r) => emit(RepoDetailState.loadSuccess(r)),
    );
  }

  Future<void> switchStarredStatus(Emitter<RepoDetailState> emit,
      {required String fullRepoName}) async {
    await state.maybeMap(
      orElse: () {},
      loadSuccess: (successState) async {
        final stateCopy = successState.copyWith();
        final repoDetail = successState.repoDetail.entity;
        if (repoDetail != null) {
          emit(
            successState.copyWith.repoDetail(
                entity: repoDetail.copyWith(starred: !repoDetail.starred)),
          );
          final failureOrSuccess =
              await _repository.switchStarredStatus(repoDetail);
          failureOrSuccess.fold(
            (l) => emit(stateCopy),
            (r) => r == null
                ? emit(stateCopy)
                : emit(state.copyWith(hasStarredStatusChanged: true)),
          );
        }
      },
    );
  }
}
