const getAllMovies = r"""
  query() {
    allMovies() {
      nodes {
        id
        imgUrl
        title
        releaseDate
        movieDirectorByMovieDirectorId {
          name
        }
        movieReviewsByMovieId {
          nodes {
            id
            body
            rating
            title
            userByUserReviewerId {
              name
              id
            }
          }
        }         
      }
    }
}
""";
