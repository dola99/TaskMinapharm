import 'package:dartz/dartz.dart';
import 'package:minapharm_task/core/Faliure/exceptions.dart';
import 'package:minapharm_task/core/Faliure/faliure.dart';
import 'package:minapharm_task/core/network_checker.dart';
import 'package:minapharm_task/feature/home/Movie/Data/Datasource/movie_local_datasource.dart';
import 'package:minapharm_task/feature/home/Movie/Data/Datasource/movie_remote_datasource.dart';
import 'package:minapharm_task/feature/home/Movie/Data/model/movie_model.dart';
import 'package:minapharm_task/feature/home/Movie/Domain/Repo/movie_repo.dart';

class MovieRepositoryImpl implements MoviesRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  final MoviesLocalDataSource moviesLocalDataSource;
  final NetworkInfo networkInfo;
  MovieRepositoryImpl(
      {required this.movieRemoteDataSource,
      required this.moviesLocalDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<Movie>>> getMovies() async {
    if (await networkInfo.isConnected) {
      List<Movie> moviesList = await movieRemoteDataSource.getMovies();
      await moviesLocalDataSource.cacheMovies(moviesList);
      return right(moviesList);
    } else {
      try {
        return await moviesLocalDataSource.getMoviesDao();
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
