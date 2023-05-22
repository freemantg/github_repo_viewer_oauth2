import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterCoreModule {
  @Named('Core')
  @lazySingleton
  Dio get dio => Dio()
    ..options = BaseOptions(
      headers: {'Accept': 'application/vnd.github.v3.html+json'},
      validateStatus: (status) =>
          status != null && status >= 200 && status < 400,
    );
}
