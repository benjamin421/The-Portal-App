// import 'package:fiber/Core/Enums/authentication_state.dart';
// import 'package:fiber/bloc/authentication/authentication_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graphql/client.dart';
// import '../../Shared/app_constants.dart' as env;

// class GraphQLService {
//   GraphQLClient _client;

// Link link;
// final HttpLink httpLink = HttpLink(
//   uri: env.uri,
// );

// if (authenticationState.authenticationToken != null && authenticationState.authenticationToken.isNotEmpty) {
//   final AuthLink authLink = AuthLink(
//     getToken: () => 'Bearer ${authenticationState.authenticationToken}',
//   );

//   link = authLink.concat(httpLink as Link);
// } else {
//   link = httpLink as Link;
// }

// final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
//   GraphQLClient(
//     cache: InMemoryCache(),
//     link: link,
//   ),
// );
  
// }

