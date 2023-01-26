import 'package:dartz/dartz.dart';
import 'package:minapharm_task/core/Faliure/faliure.dart';
import 'package:minapharm_task/feature/home/Movie/Data/model/movie_model.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<Movie>>> getMovies();
}
