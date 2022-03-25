import 'dart:convert';

import 'package:coolmovies/modules/models/movie.dart';
import 'package:coolmovies/utils/helpers/graphql_config.dart';
import 'package:coolmovies/utils/services/graphql/queries/all_movies.dart';
import 'package:coolmovies/utils/services/graphql/queries/movie_by_id.dart';
import 'package:coolmovies/utils/services/graphql/queries/review_by_id.dart';
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

  Future<Movie> getMovieById(String id) async {
    final QueryOptions options = QueryOptions(
      document: gql(movieById),
      variables: <String, dynamic>{
        "id": id,
      },
    );

    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw (result.exception.toString());
    } else {
      final movie = Movie.fromJson(result.data!['movieById']);

      return movie;
    }
  }

  Future<Review?> getReviewById(String id) async {
    final QueryOptions options = QueryOptions(
      document: gql(reviewById),
      variables: <String, dynamic>{
        "id": id,
      },
    );

    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw (result.exception.toString());
    } else {
      final review = Review.fromJson(result.data!['movieReviewById']);

      return review;
    }
  }
}
