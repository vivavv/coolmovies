import 'package:coolmovies/modules/models/movie.dart';
import 'package:coolmovies/utils/helpers/theme.dart';
import 'package:coolmovies/utils/services/movie_service.dart';
import 'package:coolmovies/widgets/movie_detail/movie_detail_info.dart';
import 'package:coolmovies/widgets/movie_detail/movie_reviews.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  MovieService? movieService;
  Movie? actualMovie;

  @override
  void initState() {
    super.initState();

    movieService = Provider.of<MovieService>(context, listen: false);

    actualMovie = movieService!.selectedMovie;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: getColor('background'),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(size.height * .065),
              child: Container(
                alignment: AlignmentDirectional.centerStart,
                padding: EdgeInsets.zero,
                color: getColor('header'),
                width: size.width * .8,
                height: size.height * .175,
                child: Row(children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  const Padding(padding: EdgeInsets.only(right: 10)),
                  const Text('User reviews',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18))
                ]),
              )),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            MovieDetailInfo(movie: actualMovie!, size: size),
            MovieReviews(movie: actualMovie!, size: size),
          ]),
          floatingActionButton: FloatingActionButton(
            heroTag: actualMovie!.id,
            onPressed: () {
              Navigator.pushNamed(context, 'review',
                  arguments: {'action': 'add'});
            },
            backgroundColor: getColor('bubble-dark'),
            child: const Icon(Icons.add),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
