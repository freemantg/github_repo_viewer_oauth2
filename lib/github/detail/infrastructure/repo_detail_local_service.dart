import 'package:github_repo_viewer_oauth2/core/infrastructure/sembast_data.dart';
import 'package:github_repo_viewer_oauth2/github/core/infrastructure/github_headers_cache.dart';
import 'package:github_repo_viewer_oauth2/github/detail/infrastructure/github_repo_detail_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/timestamp.dart';

@Injectable()
class RepoDetailLocalService {
  static const cacheSize = 50;

  final SembastDatabase _sembastDatabase;
  final GithubHeadersCache _headersCache;

  final _store = stringMapStoreFactory.store('repoDetails');

  @Injectable()
  RepoDetailLocalService({
    required SembastDatabase sembastDatabase,
    required GithubHeadersCache headersCache,
  })  : _sembastDatabase = sembastDatabase,
        _headersCache = headersCache;

  Future<void> upsertRepoDetail(GithubRepoDetailDTO githubRepoDetailDTO) async {
    await _store.record(githubRepoDetailDTO.fullName).put(
          _sembastDatabase.instance,
          githubRepoDetailDTO.toJson(),
        );

    final keys = await _store.findKeys(
      _sembastDatabase.instance,
      finder: Finder(
        sortOrders: [
          SortOrder(
            GithubRepoDetailDTO.lastUsedFieldName,
            false,
          )
        ],
      ),
    );

    if (keys.length > cacheSize) {
      final keysToRemove = keys.sublist(cacheSize);
      for (final key in keysToRemove) {
        await _store.record(key).delete(_sembastDatabase.instance);
        await _headersCache.deleteHeaders(
          Uri.https(
            'api.github.com',
            'repos/$key/readme',
          ),
        );
      }
    }
  }

  Future<GithubRepoDetailDTO?> getGithubRepoDetail(String fullRepoName) async {
    final record = _store.record(fullRepoName);

    //Updating 'lastUsed' timeStamp
    await record.update(
      _sembastDatabase.instance,
      {GithubRepoDetailDTO.lastUsedFieldName: Timestamp.now()},
    );

    final recordSnapshot = await record.getSnapshot(_sembastDatabase.instance);
    if (recordSnapshot == null) {
      return null;
    }
    return GithubRepoDetailDTO.fromSembast(recordSnapshot);
  }
}
