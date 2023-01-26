import 'package:flutter/material.dart';
import 'package:minapharm_task/feature/home/Movie/Presentaion/cubit/movie_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minapharm_task/feature/home/Movie/Presentaion/view/widget/movie_container.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
    MoviesCubit.get(context).getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        foregroundColor: Colors.black,
        title: const Text(
          "Top Movies !",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesLoadedState) {
            return MoviesContainer(moviesList: state.moviesList);
          } else {
            return const Center(
              child: Text("Something wrong happend, please try again later"),
            );
          }
        },
      ),
    );
  }
}
