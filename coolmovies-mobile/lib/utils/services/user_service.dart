import 'package:coolmovies/modules/models/user.dart';
import 'package:coolmovies/utils/helpers/graphql_config.dart';
import 'package:coolmovies/utils/services/graphql/queries/current_user.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class UserService with ChangeNotifier {
  Future<User> getUser() async {
    final QueryOptions options = QueryOptions(document: gql(getCurrentUser));

    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw (result.exception.toString());
    } else {
      final user = User.fromJson(result.data!['currentUser']);

      return user;
    }
  }
}
