// import 'package:flutter/material.dart';
// import 'package:fiber/Models/User.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import '../../Shared/AppConstants.dart';

// class UserRepository {
//   Future<User> getUserProfile() async {
//     Query retrievePortalEpisodes = Query(
//       options: QueryOptions(
//         documentNode: gql(portalQuery),
//       ),
//       builder: (QueryResult result,
//           {VoidCallback refetch, FetchMore fetchMore}) {
//         if (result.hasException) {
//           return Text(result.exception.toString());
//         }
//         if (result.loading) {
//           return Text('Loading');
//         }
//         if (result.data == null) {
//           return Text("BAD");
//         }
//         //The key to this dictionary is the name of the Query
//         var episodes = result.data["PortalEpisode"];
//         return ListView.builder(
//             itemCount: episodes.length,
//             itemBuilder: (context, index) {
//               dynamic responseData = episodes[index];
//               return PortalDashboardCard(PortalEpisode(
//                 responseData["title"],
//                 responseData["guest"],
//                 DateTime.parse(responseData["date"]),
//                 responseData["episodeNumber"],
//                 responseData["description"],
//                 responseData["imageURL"],
//               ));
//             });
//       },
//     );
    

    
//     User user = User.fromJson(data);

//     return user;
//   }
// }
