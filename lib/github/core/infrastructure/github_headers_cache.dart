import 'package:github_repo_viewer_oauth2/core/infrastructure/sembast_data.dart';
import 'package:github_repo_viewer_oauth2/github/core/github_headers.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

@Injectable()
class GithubHeadersCache {
  final SembastDatabase _sembastDatabase;
  final _store = stringMapStoreFactory.store('headers');

  GithubHeadersCache({required SembastDatabase sembastDatabase})
      : _sembastDatabase = sembastDatabase;

  //Uri is used as the unique key
  Future<void> saveHeaders(Uri uri, GithubHeaders headers) async {
    await _store.record(uri.toString()).put(
          _sembastDatabase.instance,
          headers.toJson(),
        );
  }

  Future<GithubHeaders?> getHeaders(Uri uri) async {
    final json =
        await _store.record(uri.toString()).get(_sembastDatabase.instance);
    return json == null ? null : GithubHeaders.fromJson(json);
  }

  Future<void> deleteHeaders(Uri uri) async {
    await _store.record(uri.toString()).delete(_sembastDatabase.instance);
  }
}
