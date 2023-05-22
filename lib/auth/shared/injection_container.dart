import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterGithubModule {
  FlutterSecureStorage get secureStorage => FlutterSecureStorage();
}

@module
abstract class RegisterAuthModule {
  @lazySingleton
  @Named('Auth')
  Dio get dio => Dio();
}
