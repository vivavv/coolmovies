import 'package:coolmovies/modules/models/movie.dart';
import 'package:coolmovies/utils/helpers/graphql_config.dart';
import 'package:coolmovies/utils/services/all_movies.dart';
import 'package:coolmovies/widgets/movies/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:convert';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();

    _getMovies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(size.height * .08),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  padding: EdgeInsets.zero,
                  color: Colors.purple,
                  width: size.width * .8,
                  height: size.height * .175,
                  child: const Text('soy header'),
                )),
            body: RefreshIndicator(
                onRefresh: _pullRefresh,
                child: ListView.separated(
                    itemBuilder: (context, i) => MovieItem(
                          key: Key(_movies[i].id),
                          title: _movies[i].title,
                          director: _movies[i].director.name,
                          releaseDate: _movies[i].releaseDate,
                          imgUrl: _movies[i].imgUrl,
                          reviews: _movies[i].reviews,
                        ),
                    separatorBuilder: (_, i) => const Divider(),
                    itemCount: _movies.length))));
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

  Future<void> _pullRefresh() async {
    _getMovies();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
