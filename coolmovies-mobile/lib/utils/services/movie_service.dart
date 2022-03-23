import 'dart:convert';

import 'package:coolmovies/modules/models/movie.dart';
import 'package:coolmovies/utils/helpers/graphql_config.dart';
import 'package:coolmovies/utils/services/graphql/queries/all_movies.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MovieService with ChangeNotifier {
  Movie? selectedMovie;

  Future<List<Movie>> getMovies() async {
    final QueryOptions options = QueryOptions(document: gql(getAllMovies));

    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw (result.exception.toString());
    } else {
      final movies =
          moviesFromJson(json.encode(result.data!['allMovies']['nodes']));

      return movies.toList();
    }
  }
}
