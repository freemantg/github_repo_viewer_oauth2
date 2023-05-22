import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_headers.freezed.dart';
part 'github_headers.g.dart';

@freezed
class GithubHeaders with _$GithubHeaders {
  const GithubHeaders._();
  @JsonSerializable(explicitToJson: true)
  const factory GithubHeaders({
    String? eTag,
    PaginationLink? link,
  }) = _GithubHeaders;

  //When a HTTP request is made from DIO a Response is returned;
  factory GithubHeaders.parse(Response response) {
    final link = response.headers.map['Link']?[0];

    return GithubHeaders(
      eTag: response.headers.map['ETag']?[0],
      link: link == null
          ? null
          : PaginationLink.parse(
              link.split(','),
              requestUrl: response.requestOptions.uri.toString(),
            ),
    );
  }
  factory GithubHeaders.fromJson(Map<String, dynamic> json) =>
      _$GithubHeadersFromJson(json);
}

//Header example which we're converting into a class
//Link: <https://api.github.com/search/repositories?q=flutter&page=2>; rel="next", <https://api.github.com/search/repositories?q=flutter&page=34>; rel="last"
@freezed
class PaginationLink with _$PaginationLink {
  const PaginationLink._();
  @JsonSerializable(explicitToJson: true)
  const factory PaginationLink({required int maxPage}) = _PaginationLink;

  //Headers are represented as a List<String> in Dio/Http
  factory PaginationLink.parse(
    List<String> values, {
    required String requestUrl,
  }) {
    return PaginationLink(
      maxPage: _extractPageNumber(
        values.firstWhere(
          (e) => e.contains('rel="last"'),
          orElse: () => requestUrl,
        ),
      ),
    );
  }

  static int _extractPageNumber(String value) {
    final uriString = RegExp(
            r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)')
        .stringMatch(value);
    return int.parse(Uri.parse(uriString!).queryParameters['page']!);
  }

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
}
