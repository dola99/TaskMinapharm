import 'package:dartz/dartz.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Entity/user.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Repo/login_repo.dart';

class SubmitNewUserUseCase {
  final LoginRepo loginRepo;
  SubmitNewUserUseCase({required this.loginRepo});

  Future<Either<String, User>> call() async {
    return await loginRepo.submitNewUser();
  }
}
