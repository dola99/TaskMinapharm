import 'package:minapharm_task/core/local_db/hive.dart';
import 'package:minapharm_task/feature/auth/Login/Data/Model/login_response.dart';
import 'package:minapharm_task/feature/auth/Login/Domain/Entity/user.dart';

abstract class LoginDataSource {
  Future<LoginResponse> login();
  Future<LoginResponse> submitNewUser();
}

class LoginDataSourceImb extends LoginDataSource {
  final LocalDb localDb;
  LoginDataSourceImb(this.localDb);
  @override
  Future<LoginResponse> login() async {
    var users = await localDb.getAll();
    print(localDb.allUsers);
    print(localDb.listOfUsers);
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> submitNewUser() async {
    var users = await localDb.insertAll(
        User(userName: 'dola', password: '1234'), LocalDbNames.userDb);
    login();
    throw UnimplementedError();
  }
}
