part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final User user;

  LoggedIn({@required this.user});
}

class GetUserProfile extends AuthenticationEvent {}

// for when bumping users
class UpdateUserProfile extends AuthenticationEvent {
  final User user;

  UpdateUserProfile(this.user);
}

class LoggedOut extends AuthenticationEvent {}
