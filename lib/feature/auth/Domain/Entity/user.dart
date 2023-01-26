import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class User extends Equatable {
  @HiveField(0)
  late final String userName;
  @HiveField(1)
  late final String password;

  User({required this.userName, required this.password});

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  @override
  List<Object?> get props => [userName, password];

  Map<String, dynamic> toMap() {
    return {
      'username': userName,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
