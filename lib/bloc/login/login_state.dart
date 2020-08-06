part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoad extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess({@required this.user});

  @override
  List<Object> get props => [user];
}

class LoginError extends LoginState {
  @override
  List<Object> get props => [];
}
