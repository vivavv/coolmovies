import 'package:coolmovies/modules/models/movie.dart';

String getReviews(List<MovieReview>? reviews) {
  final result =
      reviews!.map((review) => review.rating).reduce((a, b) => a + b);

  return (result / reviews.length).toString();
}
