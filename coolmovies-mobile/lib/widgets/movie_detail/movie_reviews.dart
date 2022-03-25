import 'package:coolmovies/modules/models/movie.dart';
import 'package:coolmovies/widgets/movie_detail/movie_review_item.dart';
import 'package:flutter/material.dart';

class MovieReviews extends StatelessWidget {
  final Movie movie;
  final Size size;
  final bool hasReview;

  const MovieReviews({
    Key? key,
    required this.movie,
    required this.size,
    required this.hasReview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 450,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, i) => MovieReviewItem(
                          key: Key(movie.reviews![i].id),
                          review: movie.reviews![i],
                          hasReview: hasReview,
                          size: size,
                        ),
                    separatorBuilder: (_, i) => const Divider(),
                    itemCount: movie.reviews!.length))
          ],
        ));
  }
}
