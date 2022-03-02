import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/networks/api_request.dart';
import 'features/home/presentation/services/home_services.dart';

GetIt sl = GetIt.instance;
Future<void> setupsl() async {
  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => ApiServiceRequester(dio: sl()));

  //Services
  sl.registerLazySingleton<HomeService>(() => HomeServiceImpl());
}
