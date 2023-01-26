import 'dart:developer';

import 'package:minapharm_task/core/Faliure/exceptions.dart';
import 'package:minapharm_task/core/local_db/hive.dart';
import 'package:minapharm_task/feature/auth/Data/Model/auth_response.dart';
import 'package:minapharm_task/feature/auth/Domain/Entity/user.dart';

abstract class AuthDataSource {
  Future<AuthResponse> login(String userName, String password);
  Future<AuthResponse> signup(String userName, String password);
}

class AuthDataSourceImb extends AuthDataSource {
  final LocalDb localDb;
  AuthDataSourceImb(this.localDb);
  @override
  Future<AuthResponse> login(String userName, String password) async {
    if (localDb.listOfUsers.isEmpty) {
      await localDb.getAllUsers();
    }
    var result = localDb.listOfUsers.firstWhere(
      (element) => element.userName == userName,
      orElse: () => User(userName: '', password: ''),
    );

    if (result == User(userName: '', password: '')) {
      throw ThisUserNotFoundInDBException();
    } else {
      if (result != User(userName: userName, password: password)) {
        throw WrongPasswordOrUserNameException();
      } else {
        return AuthResponse(
            isSucess: true, userName: userName, password: password);
      }
    }
  }

  @override
  Future<AuthResponse> signup(String userName, String password) async {
    if (localDb.listOfUsers.isEmpty) {
      await localDb.getAllUsers();
    }
    log(localDb.listOfUsers.toList().toString());
    var result = localDb.listOfUsers.firstWhere(
      (element) => element.userName == userName,
      orElse: () => User(userName: '', password: ''),
    );

    if (result == User(userName: '', password: '')) {
      await localDb.insertUser(
          User(userName: 'dola', password: '1234'), LocalDbNames.userDb);
      return AuthResponse(
          isSucess: true, userName: userName, password: password);
    } else {
      throw ThisUserIsRegestiredBeforeException();
    }
  }
}
