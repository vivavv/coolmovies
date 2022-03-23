import 'package:coolmovies/modules/screens/movies.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'movies': (_) => const MoviesPage()
};
