
import 'package:get_it/get_it.dart';
import 'package:mentor_api_task/cubit/login_cubit.dart';

import '../cache/cache_helper.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton(() => CacheHelper());
  sl.registerLazySingleton(()=>LoginCubit());
}
