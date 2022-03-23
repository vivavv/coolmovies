import 'package:coolmovies/modules/models/movie.dart';
import 'package:coolmovies/utils/helpers/get_reviews.dart';
import 'package:coolmovies/utils/helpers/theme.dart';
import 'package:coolmovies/widgets/movies/info_bubble.dart';
import 'package:flutter/material.dart';

class MovieDetailInfo extends StatelessWidget {
  final Movie movie;
  final Size size;

  const MovieDetailInfo({
    Key? key,
    required this.movie,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String imgUrl = movie.imgUrl;
    final String title = movie.title;
    final String director = movie.director.name;
    final List<MovieReview>? reviews = movie.reviews;
    final String releaseDate = movie.releaseDate;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: SizedBox(
              child: Image.network(imgUrl, width: 100, fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) {
            return Text('Poster not found',
                textAlign: TextAlign.center,
                style: TextStyle(color: getColor('text'), fontSize: 20));
          })),
        ),
        const Padding(padding: EdgeInsets.only(right: 5)),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: SizedBox(
                height: 135,
                width: size.width * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: getColor('text')),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text(director, style: TextStyle(color: getColor('text'))),
                    const Padding(padding: EdgeInsets.only(bottom: 30)),
                    Row(children: [
                      InfoBubble(info: getReviews(reviews), showIcon: true),
                      InfoBubble(
                          info: releaseDate.substring(0, 4), showIcon: false),
                    ]),
                  ],
                )))
      ],
    );
  }
}
