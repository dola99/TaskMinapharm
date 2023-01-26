import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minapharm_task/core/Faliure/faliure.dart';
import 'package:minapharm_task/feature/auth/Domain/Entity/user.dart';
import 'package:minapharm_task/feature/auth/Domain/Usecase/login_usecase.dart';
import 'package:minapharm_task/feature/auth/Domain/Usecase/signup_usecase.dart';
import 'package:minapharm_task/feature/auth/Presentaion/Cubit/login_states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.loginUseCase, this.signupUseCase) : super(InitialState());
  late final LoginUseCase loginUseCase;
  late final SignupNewUserUseCase signupUseCase;
  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  late List<User> allUsers;

  Future<void> login(String userName, String password) async {
    var result = await loginUseCase(userName, password);
    result.fold((failure) => emit(LoginFailed(failureMap[failure]!.errorMsg)),
        (sucesss) => emit(LoginSuccesfully()));
  }

  Future<void> signup(String userName, String password) async {
    var result = await signupUseCase(userName, password);
    result.fold((failure) => emit(SignupFailed(failureMap[failure]!.errorMsg)),
        (sucesss) => emit(SignupSuccesfully()));
  }
}
