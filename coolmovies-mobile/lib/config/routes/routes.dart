import 'package:coolmovies/modules/screens/movie_detail.dart';
import 'package:coolmovies/modules/screens/movies.dart';
import 'package:coolmovies/modules/screens/review.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'movies': (_) => const MoviesPage(),
  'movieDetail': (_) => const MovieDetail(),
  'review': (_) => const Review(),
};
