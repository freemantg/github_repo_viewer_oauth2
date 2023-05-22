import 'package:github_repo_viewer_oauth2/github/core/infrastructure/pagination_config.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

import '../../../../core/infrastructure/sembast_data.dart';
import '../../../core/infrastructure/github_repo_dto.dart';
import 'package:collection/collection.dart';

@Injectable()
class StarredReposLocalService {
  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store('starredRepos');

  StarredReposLocalService({required SembastDatabase sembastDatabase})
      : _sembastDatabase = sembastDatabase;

  Future<void> upsertPage(List<GithubRepoDTO> dtos, int page) async {
    final sembastPage = page - 1;

    // 0,1,2...30|| 31...60|| 61...90..0

    await _store
        .records(dtos.mapIndexed(
            (index, _) => index + PaginationConfig.itemsPerPage * sembastPage))
        .put(
          _sembastDatabase.instance,
          dtos.map((e) => e.toJson()).toList(),
        );
  }

  //Local Pagination
  Future<List<GithubRepoDTO>> getPage(int page) async {
    final sembastPage = page - 1;

    final records = await _store.find(_sembastDatabase.instance,
        finder: Finder(
          limit: PaginationConfig.itemsPerPage,
          offset: PaginationConfig.itemsPerPage * sembastPage,
        ));

    return records.map((e) => GithubRepoDTO.fromJson(e.value)).toList();
  }

  Future<int> getLocalPageCount() async {
    final repoCount = await _store.count(_sembastDatabase.instance);
    return (repoCount % PaginationConfig.itemsPerPage).ceil();
  }
}
