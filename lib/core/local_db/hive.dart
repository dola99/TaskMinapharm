import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:minapharm_task/feature/auth/Domain/Entity/user.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalDbNames {
  static String userDb = 'user';
}

class LocalDb {
  late Box<User> allUsers;
  Iterable<User> listOfUsers = [];

  Future<void> initOfLocalStorge() async {
    Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    allUsers = await openDataBase<User>(LocalDbNames.userDb);
  }

  Future<Box<E>> openDataBase<E>(String nameOfDB) async {
    return Hive.openBox<E>(nameOfDB);
  }

  Future<LazyBox<E>> openLazyDataBase<E>(String nameOfDB) async {
    return Hive.openLazyBox<E>(nameOfDB);
  }

  Future<void> insertAll(User user, String nameOfDB) async {
    allUsers.add(user);
    await allUsers.close();
  }

  Future<void> getAll() async {
    // final box = await Hive.openBox(LocalDbNames.supportedCurrencyDbName);
    if (!allUsers.isOpen) {
      allUsers = await Hive.openBox(LocalDbNames.userDb);
    }
    final allUsersList = allUsers.values;

    listOfUsers = allUsersList;
    //listOfSupportedCurrency = currencyItemlist;
    // await supportedCurrency.close();
  }
}
