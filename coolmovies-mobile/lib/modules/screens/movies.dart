import 'package:coolmovies/modules/models/movie.dart';
import 'package:coolmovies/modules/models/user.dart';
import 'package:coolmovies/utils/helpers/graphql_config.dart';
import 'package:coolmovies/utils/helpers/theme.dart';
import 'package:coolmovies/utils/services/graphql/queries/all_movies.dart';
import 'package:coolmovies/utils/services/graphql/queries/current_user.dart';
import 'package:coolmovies/utils/services/movie_service.dart';
import 'package:coolmovies/widgets/footer.dart';
import 'package:coolmovies/widgets/movies/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<Movie> _movies = [];
  User _currentUser = User(id: '', name: '');

  @override
  void initState() {
    super.initState();

    _getMovies();
    _getCurrentUser();
  }

  //Queries
  void _getMovies() async {
    final QueryOptions options = QueryOptions(document: gql(getAllMovies));

    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw (result.exception.toString());
    } else {
      // ignore: avoid_print
      setState(() {
        _movies =
            moviesFromJson(json.encode(result.data!['allMovies']['nodes']));
      });
    }
  }

  void _getCurrentUser() async {
    final QueryOptions options = QueryOptions(document: gql(getCurrentUser));

    GraphQLConfig graphQLConfiguration = GraphQLConfig();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw (result.exception.toString());
    } else {
      final user = User.fromJson(result.data!['currentUser']);

      setState(() {
        _currentUser = user;
      });
    }
  }

  Future<void> _pullRefresh() async {
    _getMovies();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: getColor('background'),
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(size.height * .08),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  padding: EdgeInsets.zero,
                  color: getColor('header'),
                  width: size.width * .8,
                  height: size.height * .175,
                  child: const Text(
                    'CoolMovies',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                )),
            body: RefreshIndicator(
                onRefresh: _pullRefresh,
                child: ListView.separated(
                    itemBuilder: (context, i) => MovieItem(
                          key: Key(_movies[i].id),
                          movie: _movies[i],
                          onTap: (movie) {
                            final movieService = Provider.of<MovieService>(
                                context,
                                listen: false);
                            movieService.selectedMovie = movie;
                            Navigator.pushNamed(context, 'movieDetail');
                          },
                        ),
                    separatorBuilder: (_, i) => const Divider(),
                    itemCount: _movies.length)),
            bottomNavigationBar: Footer(username: _currentUser.name)));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
