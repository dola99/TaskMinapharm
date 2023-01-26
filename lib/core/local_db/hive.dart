import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:minapharm_task/feature/auth/Domain/Entity/user.dart';
import 'package:minapharm_task/feature/home/Movie/Data/model/movie_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalDbNames {
  static String userDb = 'user';
  static String moviesDb = 'Movies';
}

class LocalDb {
  late Box<User> allUsers;
  late Box<Movie> allMovies;
  Iterable<User> listOfUsers = [];
  Iterable<Movie> listOfMovies = [];

  Future<void> initOfLocalStorge() async {
    Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    allUsers = await openDataBase<User>(LocalDbNames.userDb);
    allMovies = await openDataBase<Movie>(LocalDbNames.moviesDb);
  }

  Future<Box<E>> openDataBase<E>(String nameOfDB) async {
    return Hive.openBox<E>(nameOfDB);
  }

  Future<LazyBox<E>> openLazyDataBase<E>(String nameOfDB) async {
    return Hive.openLazyBox<E>(nameOfDB);
  }

  Future<void> insertUser(User user, String nameOfDB) async {
    allUsers.add(user);
    await allUsers.close();
  }

  Future<void> insertMOvies(
    List<Movie> movie,
  ) async {
    allMovies.addAll(movie);
    await allMovies.close();
  }

  Future<void> getAllUsers() async {
    // final box = await Hive.openBox(LocalDbNames.supportedCurrencyDbName);
    if (!allUsers.isOpen) {
      allUsers = await Hive.openBox(LocalDbNames.userDb);
    }
    final allUsersList = allUsers.values;

    listOfUsers = allUsersList;
    //listOfSupportedCurrency = currencyItemlist;
    // await supportedCurrency.close();
  }

  Future<void> getAllMovies() async {
    // final box = await Hive.openBox(LocalDbNames.supportedCurrencyDbName);
    if (!allMovies.isOpen) {
      allMovies = await Hive.openBox(LocalDbNames.moviesDb);
    }
    final allMoviesList = allMovies.values;

    listOfMovies = allMoviesList;
    //listOfSupportedCurrency = currencyItemlist;
    // await supportedCurrency.close();
  }
}
