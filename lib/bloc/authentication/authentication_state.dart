part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final String message;
  final User user;

  AuthenticationState({@required this.status, this.user, this.message});

  AuthenticationState authenticated(User user) =>
      copyWith(status: AuthenticationStatus.authenticated, user: user);

  AuthenticationState unauthenticated() =>
      copyWith(status: AuthenticationStatus.unauthenticated);

  AuthenticationState error(String message) =>
      copyWith(status: AuthenticationStatus.error, message: message);

  AuthenticationState loading() =>
      copyWith(status: AuthenticationStatus.loading);

  factory AuthenticationState.init() =>
      AuthenticationState(status: AuthenticationStatus.uninitialized);

  AuthenticationState copyWith(
          {AuthenticationStatus status, User user, String message}) =>
      AuthenticationState(
          status: status ?? this.status,
          user: user ?? this.user,
          message: message ?? this.message);

  @override
  List<Object> get props => [user, status, message];
}
