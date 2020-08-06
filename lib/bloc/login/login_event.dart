part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginPressed extends LoginEvent {
  final String email;
  final String password;

  LoginPressed({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
