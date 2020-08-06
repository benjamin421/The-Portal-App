import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fiber/Models/access_data.dart';
import 'package:fiber/Models/user.dart';
import 'package:fiber/bloc/authentication/authentication_bloc.dart';

part 'graphql_event.dart';
part 'graphql_state.dart';

class GraphqlBloc extends Bloc<GraphqlEvent, GraphqlState> {
  final AuthenticationBloc _authenticationBloc;

  GraphqlBloc(this._authenticationBloc) : super(GraphqlInitial());

  @override
  Stream<GraphqlState> mapEventToState(
    GraphqlEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
