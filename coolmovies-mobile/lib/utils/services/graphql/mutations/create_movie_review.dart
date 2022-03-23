const createMovieReview = r"""
  mutation {
    createMovieReview(input: {
      movieReview: {
        title: "Test",
        body: "Lorem Ipsum Text",
        rating: 4,
        movieId: "70351289-8756-4101-bf9a-37fc8c7a82cd",
        userReviewerId: "5f1e6707-7c3a-4acd-b11f-fd96096abd5a"
      }
    })
    {
      movieReview {
        id
        title
        body
        rating
        movieByMovieId {
          title
        }
        userByUserReviewerId {
          name
        }
      }
    }
  }
""";
