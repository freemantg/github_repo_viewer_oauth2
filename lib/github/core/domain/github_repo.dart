import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared/colors.dart';
import 'user.dart';

part 'github_repo.freezed.dart';

@freezed
class GithubRepo with _$GithubRepo {
  const GithubRepo._();
  const factory GithubRepo(
      {required User owner,
      required String name,
      required String description,
      required int stargazersCount,
      required String language,
      required int forksCount,
      required DateTime updatedAt,
      d}) = _GithubRepo;

  String get fullName => '${owner.name}/$name';

  Color get languageColor =>
      Color(int.tryParse(colors['$language'] ?? '') ?? 0);
}
