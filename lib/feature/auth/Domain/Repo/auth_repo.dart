import 'package:dartz/dartz.dart';
import 'package:minapharm_task/core/Faliure/faliure.dart';
import 'package:minapharm_task/feature/auth/Domain/Entity/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> login(String userName, String password);
  Future<Either<Failure, User>> submitNewUser(String userName, String password);
}
