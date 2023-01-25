import 'package:dartz/dartz.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Entity/user.dart';

abstract class LoginRepo {
  Future<Either<String, User>> login();
  Future<Either<String, User>> submitNewUser();
}
