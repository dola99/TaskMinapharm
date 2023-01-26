import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ThisUserIsRegestiredBeforeFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ThisUserNotFoundInDBFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class WrongPasswordOrUserNameFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ApiFailure extends Failure {
  final String errorMsg;
  ApiFailure({
    required this.errorMsg,
  });
  @override
  List<Object?> get props => [errorMsg];
}

Map<Failure, ErrorComponets> failureMap = {
  ServerFailure():
      ErrorComponets(errorMsg: 'Server is down, Please try again later'),
  OfflineFailure(): ErrorComponets(
    errorMsg: 'There is no internet connection',
  ),
  NotFoundFailure(): ErrorComponets(
    errorMsg: 'Unexpected error, Please try again later',
  ),
  ThisUserIsRegestiredBeforeFailure():
      ErrorComponets(errorMsg: 'This User is Regstired before'),
  ThisUserNotFoundInDBFailure():
      ErrorComponets(errorMsg: 'This User is Not Fount In DB '),
  WrongPasswordOrUserNameFailure():
      ErrorComponets(errorMsg: 'Wrong passord Or Username'),
};

class ErrorComponets {
  final String errorMsg;

  ErrorComponets({
    required this.errorMsg,
  });
}
