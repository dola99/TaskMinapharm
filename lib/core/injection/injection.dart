import 'package:get_it/get_it.dart';
import 'package:minapharm_task/core/local_db/hive.dart';
import 'package:minapharm_task/feature/auth/Login/Data/Datasource/login_datasource.dart';
import 'package:minapharm_task/feature/auth/Login/Data/Repo/login_repo_imb.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Repo/login_repo.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Usecase/login_usecase.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Usecase/submit_new_user_usecase.dart';
import 'package:minapharm_task/feature/auth/Login/Presentaion/Cubit/login_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {
//Bloc
  locator.registerLazySingleton(() => LoginCubit(locator(), locator()));
//REPO
  locator.registerLazySingleton<LoginRepo>(() => LoginRepoImb(locator()));

  //DataSource
  locator.registerLazySingleton<LoginDataSource>(
      () => LoginDataSourceImb(locator()));
  //usecase
  locator.registerLazySingleton(() => LoginUseCase(loginRepo: locator()));
  locator
      .registerLazySingleton(() => SubmitNewUserUseCase(loginRepo: locator()));
  // Service
  locator.registerLazySingleton(() => LocalDb());
}
