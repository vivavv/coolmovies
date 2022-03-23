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
            body
            rating
            title
          }
        }         
      }
    }
}
""";
