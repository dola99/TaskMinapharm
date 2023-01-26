import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minapharm_task/core/injection/injection.dart' as db;
import 'package:minapharm_task/core/local_db/hive.dart';
import 'package:minapharm_task/core/shared_pref_singleton.dart';
import 'package:minapharm_task/feature/auth/Presentaion/Cubit/login_cubit.dart';
import 'package:minapharm_task/feature/auth/Presentaion/View/login_view.dart';
import 'package:minapharm_task/feature/home/Movie/Presentaion/cubit/movie_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await db.init();
  await db.locator<LocalDb>().initOfLocalStorge();
  await Prefs.init();
  runApp(const StartPoint());
}

class StartPoint extends StatelessWidget {
  const StartPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => db.locator<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => db.locator<MoviesCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MinaPharm Task',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
