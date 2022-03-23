import 'package:coolmovies/modules/models/movie.dart';
import 'package:coolmovies/utils/helpers/get_reviews.dart';
import 'package:coolmovies/utils/helpers/shorten_string.dart';
import 'package:coolmovies/utils/helpers/theme.dart';
import 'package:coolmovies/utils/services/movie_service.dart';
import 'package:coolmovies/widgets/movies/info_bubble.dart';
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
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: SizedBox(
                      child: Image.network(actualMovie!.imgUrl,
                          width: 125,
                          fit: BoxFit.contain, errorBuilder: (_, __, ___) {
                    return Text('Poster not found',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: getColor('text'), fontSize: 20));
                  })),
                ),
                const Padding(padding: EdgeInsets.only(right: 5)),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: SizedBox(
                        height: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shortenString(actualMovie!.title, 35),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: getColor('text')),
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 10)),
                            Text(actualMovie!.director.name,
                                style: TextStyle(color: getColor('text'))),
                            const Padding(padding: EdgeInsets.only(bottom: 50)),
                            InfoBubble(
                                info: getReviews(actualMovie!.reviews),
                                showIcon: true),
                            const Padding(padding: EdgeInsets.only(bottom: 10)),
                            InfoBubble(
                                info: actualMovie!.releaseDate.substring(0, 4),
                                showIcon: false),
                          ],
                        )))
              ],
            )));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
