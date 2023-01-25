import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Entity/user.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Usecase/login_usecase.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Usecase/submit_new_user_usecase.dart';
import 'package:minapharm_task/feature/auth/Login/Presentaion/Cubit/login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase, this.sub) : super(InitialState());
  late final LoginUseCase loginUseCase;
  late final SubmitNewUserUseCase sub;
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  late List<User> allUsers;
  Future<List<User>> getAllUser() async {
    await sub();
    throw UnimplementedError();
  }
}
