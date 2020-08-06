import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fiber/Core/Enums/authentication_state.dart';
import 'package:fiber/Core/Repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:fiber/Models/User.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

AuthenticationBloc(this.userRepository) : super(AuthenticationState.init());


  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      try {
        final bool hasToken = await userRepository.hasToken();

        if (hasToken) {
          if (userRepository.hasTokenExpired()) {
            try {
              await userRepository.refreshToken();
              User user = await userRepository.getUserProfile();
              yield state.authenticated(user);
            } catch (e) {
              print(e.message);
              yield state.unauthenticated();
            }
          } else {
            User user = await userRepository.getUserProfile();
            yield state.authenticated(user);
          }
        } else {
          yield state.unauthenticated();
        }
      } catch (e) {
        yield state.error(e.toString());
        yield state.unauthenticated();
      }
    } else if (event is LoggedIn) {
      yield state.loading();
       await userRepository.persistToken(event.token);
      yield state.authenticated(event.user);
    } else if (event is LoggedOut) {
      yield state.loading();
      await userRepository.deleteToken();
      yield state.unauthenticated();
      print(state.status);
    } else if (event is GetUserProfile) {
      User user = await userRepository.getUserProfile();
      yield state.copyWith(user: user);
     } // else if (event is UpdateUserProfile) {
    //   // User user = await userRepository.updateUser(event.user);
    //   // yield state.copyWith(user: user);
    // }
  }
}
