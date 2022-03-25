const createMovieReview = r"""
  mutation ($input: CreateMovieReviewInput!) {
    createMovieReview(input: $input)
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
