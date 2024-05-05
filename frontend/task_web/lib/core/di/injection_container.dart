import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../services/remote/web_service.dart';
import 'home_injection.dart';

/// sl -> Service Locator
final sl = GetIt.instance;

void initialize() {
  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => WebService(dio: sl()));

  HomeInjection.init();

  //! Core
}
