part of 'graphql_bloc.dart';

abstract class GraphqlState extends Equatable {
  const GraphqlState();
}

class GraphqlInitial extends GraphqlState {
  @override
  List<Object> get props => [];
}

class GraphqlAuth extends GraphqlState {
  @override
  List<Object> get props => [];
}

class GraphqlNotAuth extends GraphqlState {
  @override
  List<Object> get props => [];
}
