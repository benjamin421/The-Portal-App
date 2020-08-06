import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fiber/Models/User.dart';
import 'package:fiber/bloc/authentication/authentication_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;

  LoginBloc(this._authenticationBloc) : super(LoginInitial());

 


  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginPressed) {
      yield LoginLoad();
      // await FirebaseAuth.instance.signInWithEmailAndPassword(
      //     email: event.email, password: event.password);
      UserData user = await _authenticationBloc.userRepository
          .login();
      if (user != null) {
        _authenticationBloc.add(LoggedIn(user: user));
        yield LoginSuccess(user: user);
      } else {
        yield LoginError();
        yield LoginInitial();
      }
    }
  }
}
