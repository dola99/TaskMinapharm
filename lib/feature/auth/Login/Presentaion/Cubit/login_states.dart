abstract class LoginState {}

class InitialState extends LoginState {}

class LoadingState extends LoginState {}

class LoginSuccesfully extends LoginState {}

class LoginFailed extends LoginState {
  final String errorMsg;
  LoginFailed(this.errorMsg);
}
