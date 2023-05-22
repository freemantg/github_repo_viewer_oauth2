import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/github_repo.dart';
import 'user_dto.dart';

part 'github_repo_dto.freezed.dart';
part 'github_repo_dto.g.dart';

String _stringFromJson(Object? json) {
  return (json as String?) ?? '';
}

@freezed
class GithubRepoDTO with _$GithubRepoDTO {
  @JsonSerializable(explicitToJson: true)
  const GithubRepoDTO._();
  const factory GithubRepoDTO({
    required UserDTO owner,
    required String name,
    @JsonKey(fromJson: _stringFromJson) required String description,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
    @JsonKey(fromJson: _stringFromJson) required String language,
    @JsonKey(name: 'forks_count') required int forksCount,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _GithubRepoDTO;

  factory GithubRepoDTO.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoDTOFromJson(json);

  factory GithubRepoDTO.fromDomain(GithubRepo _) {
    return GithubRepoDTO(
      owner: UserDTO.fromDomain(_.owner),
      name: _.name,
      description: _.description,
      stargazersCount: _.stargazersCount,
      language: _.language,
      forksCount: _.forksCount,
      updatedAt: _.updatedAt.toIso8601String(),
    );
  }
}

extension GithubRepoDTOX on GithubRepoDTO {
  GithubRepo toDomain() => GithubRepo(
        owner: owner.toDomain(),
        name: name,
        description: description,
        stargazersCount: stargazersCount,
        language: language,
        forksCount: forksCount,
        updatedAt: DateTime.parse(updatedAt),
      );
}
