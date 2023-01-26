import 'package:minapharm_task/core/Faliure/exceptions.dart';
import 'package:minapharm_task/core/local_db/hive.dart';
import 'package:minapharm_task/feature/home/Movie/Data/model/movie_model.dart';

class MoviesLocalDataSource {
  final LocalDb movieLocal;
  MoviesLocalDataSource({required this.movieLocal});
  getMoviesDao() async {
    await movieLocal.getAllMovies();
    var movieList = movieLocal.listOfMovies;
    if (movieList.isNotEmpty) {
      return movieList;
    } else {
      throw EmptyCacheException();
    }
  }

  cacheMovies(List<Movie> movies) async {
    await movieLocal.getAllMovies();
    await movieLocal.insertMOvies(movies);
  }
}
