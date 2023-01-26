import 'package:get_it/get_it.dart';
import 'package:minapharm_task/core/local_db/hive.dart';
import 'package:minapharm_task/feature/auth/Data/Datasource/auth_data_source.dart';
import 'package:minapharm_task/feature/auth/Data/Repo/auth_repo_imb.dart';
import 'package:minapharm_task/feature/auth/Domain/Repo/auth_repo.dart';
import 'package:minapharm_task/feature/auth/Domain/Usecase/login_usecase.dart';
import 'package:minapharm_task/feature/auth/Domain/Usecase/signup_usecase.dart';
import 'package:minapharm_task/feature/auth/Presentaion/Cubit/login_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {
//Bloc
  locator.registerLazySingleton(() => AuthCubit(locator(), locator()));
//REPO
  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImb(locator()));

  //DataSource
  locator.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImb(locator()));
  //usecase
  locator.registerLazySingleton(() => LoginUseCase(authRepo: locator()));
  locator
      .registerLazySingleton(() => SignupNewUserUseCase(authRepo: locator()));

  // Service
  locator.registerLazySingleton(() => LocalDb());
}
