import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minapharm_task/core/Faliure/faliure.dart';
import 'package:minapharm_task/feature/home/Movie/Data/model/movie_model.dart';
import 'package:minapharm_task/feature/home/Movie/Domain/Usecase/movie_usecase.dart';

part 'movie_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetMoviesUsecase moviesUsecase;
  MoviesCubit(this.moviesUsecase) : super(MoviesInitial());
  static MoviesCubit get(BuildContext context) => BlocProvider.of(context);

  getMovies() async {
    emit(MoviesLoadingState());
    var moviesList = await moviesUsecase();
    moviesList.fold(
        (failure) => emit(MoviesErrorState(failureMap[failure]!.errorMsg)),
        (sucess) => emit(MoviesLoadedState(sucess)));
  }
}
