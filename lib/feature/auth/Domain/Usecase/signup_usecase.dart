import 'package:dartz/dartz.dart';
import 'package:minapharm_task/core/Faliure/faliure.dart';
import 'package:minapharm_task/feature/auth/Domain/Entity/user.dart';
import 'package:minapharm_task/feature/auth/Domain/Repo/auth_repo.dart';

class SignupNewUserUseCase {
  final AuthRepo authRepo;
  SignupNewUserUseCase({required this.authRepo});

  Future<Either<Failure, User>> call(String userName, String password) async {
    return await authRepo.submitNewUser(userName, password);
  }
}
