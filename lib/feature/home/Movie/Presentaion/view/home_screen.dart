import 'package:flutter/material.dart';
import 'package:minapharm_task/core/route/navigation.dart';
import 'package:minapharm_task/core/shared_pref_singleton.dart';
import 'package:minapharm_task/feature/auth/Presentaion/View/login_view.dart';
import 'package:minapharm_task/feature/home/Movie/Presentaion/view/movie_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Prefs.remove('userName');
              CustomFunctions.cleanAndPush(
                  widget: const LoginScreen(), context: context);
            },
            icon: const Icon(Icons.logout),
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Hello ${Prefs.getString('userName')}',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              CustomFunctions.pushScreen(
                  widget: const MoviesPage(), context: context);
            },
            child: const Text("Movies"),
          ),
        ],
      ),
    );
  }
}
