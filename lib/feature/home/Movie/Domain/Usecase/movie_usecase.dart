import 'package:dartz/dartz.dart';
import 'package:minapharm_task/core/Faliure/faliure.dart';
import 'package:minapharm_task/feature/home/Movie/Data/model/movie_model.dart';
import 'package:minapharm_task/feature/home/Movie/Domain/Repo/movie_repo.dart';

class GetMoviesUsecase {
  final MoviesRepository movieRepository;
  GetMoviesUsecase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await movieRepository.getMovies();
  }
}
