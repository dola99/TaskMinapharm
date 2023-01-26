import 'package:minapharm_task/feature/auth/Domain/Entity/user.dart';

class AuthResponse extends User {
  final bool isSucess;
  AuthResponse(
      {required this.isSucess,
      required super.userName,
      required super.password});
}
