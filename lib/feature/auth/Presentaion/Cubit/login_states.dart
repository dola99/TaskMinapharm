abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class LoginSuccesfully extends AuthState {}

class LoginFailed extends AuthState {
  final String errorMsg;
  LoginFailed(this.errorMsg);
}

class SignupSuccesfully extends AuthState {}

class SignupFailed extends AuthState {
  final String errorMsg;
  SignupFailed(this.errorMsg);
}
