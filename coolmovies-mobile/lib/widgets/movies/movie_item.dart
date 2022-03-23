import 'package:coolmovies/modules/models/movie.dart';
import 'package:coolmovies/utils/helpers/shorten_string.dart';
import 'package:coolmovies/utils/helpers/theme.dart';
import 'package:coolmovies/widgets/movies/info_bubble.dart';
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String title;
  final String director;
  final String releaseDate;
  final String imgUrl;
  final List<MovieReview>? reviews;

  const MovieItem(
      {Key? key,
      required this.title,
      required this.director,
      required this.releaseDate,
      required this.imgUrl,
      this.reviews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: SizedBox(
              child: Image.network(imgUrl, width: 125, fit: BoxFit.contain,
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
                height: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shortenString(title, 35),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: getColor('text')),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text(director, style: TextStyle(color: getColor('text'))),
                    const Padding(padding: EdgeInsets.only(bottom: 50)),
                    InfoBubble(info: _getReviews(), showIcon: true),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    InfoBubble(
                        info: releaseDate.substring(0, 4), showIcon: false),
                  ],
                )))
      ],
    );
  }

  String _getReviews() {
    final result =
        reviews!.map((review) => review.rating).reduce((a, b) => a + b);

    return (result / reviews!.length).toString();
  }
}
