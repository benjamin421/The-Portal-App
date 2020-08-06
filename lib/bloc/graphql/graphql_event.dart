part of 'graphql_bloc.dart';

abstract class GraphqlEvent {
  const GraphqlEvent();
}

class SetHeaders extends GraphqlEvent {
  final AccessData data;

  SetHeaders({this.data});
}
