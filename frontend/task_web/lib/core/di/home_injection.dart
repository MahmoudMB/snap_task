import '../../features/home/home_exports.dart';
import 'injection_container.dart';

class HomeInjection {
  static void init() {
    sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(
        webService: sl(),
      ),
    );
    sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        remoteDataSource: sl(),
      ),
    );
  }
}
