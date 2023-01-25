import 'package:dartz/dartz.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Entity/user.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Repo/login_repo.dart';

class LoginUseCase {
  final LoginRepo loginRepo;
  LoginUseCase({required this.loginRepo});

  Future<Either<String, User>> call() async {
    return await loginRepo.login();
  }
}
