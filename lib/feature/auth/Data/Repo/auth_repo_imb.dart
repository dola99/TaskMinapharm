import 'package:minapharm_task/core/Faliure/exceptions.dart';
import 'package:minapharm_task/core/Faliure/faliure.dart';
import 'package:minapharm_task/core/shared_pref_singleton.dart';
import 'package:minapharm_task/feature/auth/Data/Datasource/auth_data_source.dart';
import 'package:minapharm_task/feature/auth/Domain/Entity/user.dart';
import 'package:minapharm_task/feature/auth/Domain/Repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImb extends AuthRepo {
  late final AuthDataSource authDataSource;
  AuthRepoImb(this.authDataSource);
  @override
  Future<Either<Failure, User>> login(String userName, String password) async {
    try {
      var response = await authDataSource.login(userName, password);
      Prefs.setString('userName', response.userName);

      return Right(response);
    } on ThisUserNotFoundInDBException {
      return Left(ThisUserNotFoundInDBFailure());
    } on WrongPasswordOrUserNameException {
      return Left(WrongPasswordOrUserNameFailure());
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Either<Failure, User>> submitNewUser(
      String userName, String password) async {
    try {
      var response = await authDataSource.signup(userName, password);
      Prefs.setString('userName', response.userName);
      return Right(response);
    } on ThisUserIsRegestiredBeforeException {
      return Left(ThisUserIsRegestiredBeforeFailure());
    } catch (e) {
      print(e);
      throw UnimplementedError();
    }
  }
}
