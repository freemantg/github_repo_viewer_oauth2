import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection(String environment) async {
  await $initGetIt(getIt);

  //Adding OAuth2Interceptor to Dio.
  getIt<Dio>(instanceName: 'Core')..interceptors.add(getIt());
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
