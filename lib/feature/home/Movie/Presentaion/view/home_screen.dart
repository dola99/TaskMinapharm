import 'package:flutter/material.dart';
import 'package:minapharm_task/core/shared_pref_singleton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text('Hello ${Prefs.getString('userName')}')],
      ),
    );
  }
}
