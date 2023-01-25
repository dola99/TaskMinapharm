import 'package:minapharm_task/feature/auth/Login/Domain/Entity/user.dart';

class LoginResponse extends User {
  final bool isSucess;
  LoginResponse(
      {required this.isSucess,
      required super.userName,
      required super.password});
}
