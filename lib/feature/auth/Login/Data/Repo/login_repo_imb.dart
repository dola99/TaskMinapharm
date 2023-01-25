import 'package:minapharm_task/feature/auth/Login/Data/Datasource/login_datasource.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Entity/user.dart';
import 'package:dartz/dartz.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Repo/login_repo.dart';

class LoginRepoImb extends LoginRepo {
  late final LoginDataSource loginDataSource;
  LoginRepoImb(this.loginDataSource);
  @override
  Future<Either<String, User>> login() async {
    await loginDataSource.login();
    throw UnimplementedError();
  }

  @override
  Future<Either<String, User>> submitNewUser() async {
    await loginDataSource.submitNewUser();
    throw UnimplementedError();
  }
}
