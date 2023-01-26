import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:minapharm_task/core/local_db/hive.dart';
import 'package:minapharm_task/core/network_checker.dart';
import 'package:minapharm_task/feature/auth/Data/Datasource/auth_data_source.dart';
import 'package:minapharm_task/feature/auth/Data/Repo/auth_repo_imb.dart';
import 'package:minapharm_task/feature/auth/Domain/Repo/auth_repo.dart';
import 'package:minapharm_task/feature/auth/Domain/Usecase/login_usecase.dart';
import 'package:minapharm_task/feature/auth/Domain/Usecase/signup_usecase.dart';
import 'package:minapharm_task/feature/auth/Presentaion/Cubit/login_cubit.dart';
import 'package:minapharm_task/feature/home/Movie/Data/Datasource/movie_local_datasource.dart';
import 'package:minapharm_task/feature/home/Movie/Data/Datasource/movie_remote_datasource.dart';
import 'package:minapharm_task/feature/home/Movie/Data/Repo/movie_repo_imb.dart';
import 'package:minapharm_task/feature/home/Movie/Domain/Repo/movie_repo.dart';
import 'package:minapharm_task/feature/home/Movie/Domain/Usecase/movie_usecase.dart';
import 'package:minapharm_task/feature/home/Movie/Presentaion/cubit/movie_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {
//Bloc
  locator.registerLazySingleton(() => AuthCubit(locator(), locator()));
  locator.registerLazySingleton(() => MoviesCubit(
        locator(),
      ));
//REPO
  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImb(locator()));
  locator.registerLazySingleton<MoviesRepository>(() => MovieRepositoryImpl(
      movieRemoteDataSource: locator(),
      moviesLocalDataSource: locator(),
      networkInfo: locator()));

  //DataSource
  locator.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImb(locator()));
  locator.registerLazySingleton(
      () => MoviesLocalDataSource(movieLocal: locator()));
  locator.registerLazySingleton(() => MovieRemoteDataSource());
  //usecase
  locator.registerLazySingleton(() => LoginUseCase(authRepo: locator()));
  locator.registerLazySingleton(() => GetMoviesUsecase(locator()));
  locator
      .registerLazySingleton(() => SignupNewUserUseCase(authRepo: locator()));

  // Service
  locator.registerLazySingleton(() => LocalDb());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  locator.registerLazySingleton(() => InternetConnectionChecker());
}
