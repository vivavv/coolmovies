import 'dart:convert';

List<Movie> moviesFromJson(String str) =>
    List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

class Movie {
  Movie({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.releaseDate,
    required this.director,
    this.reviews,
  });

  String id;
  String imgUrl;
  String title;
  String releaseDate;
  MovieDirector director;
  List<MovieReview>? reviews;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json["id"],
      imgUrl: json["imgUrl"],
      title: json["title"],
      releaseDate: json["releaseDate"],
      reviews: json["movieReviewsByMovieId"]["nodes"] == null
          ? null
          : List<MovieReview>.from(json["movieReviewsByMovieId"]["nodes"]
              .map((x) => MovieReview.fromJson(x))),
      director: MovieDirector.fromJson(json["movieDirectorByMovieDirectorId"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "imgUrl": imgUrl,
        "title": title,
        "releaseDate": releaseDate,
        "director": director.toJson(),
        "reviews": reviews
      };
}

class MovieReview {
  MovieReview({required this.title, required this.body, required this.rating});

  String title;
  String body;
  int rating;

  factory MovieReview.fromJson(Map<String, dynamic> json) => MovieReview(
      title: json["title"], body: json["body"], rating: json["rating"]);

  Map<String, dynamic> toJson() =>
      {"title": title, "body": body, "rating": rating};
}

class MovieDirector {
  MovieDirector({required this.name});

  String name;

  factory MovieDirector.fromJson(Map<String, dynamic> json) =>
      MovieDirector(name: json["name"]);

  Map<String, dynamic> toJson() => {"name": name};
}
