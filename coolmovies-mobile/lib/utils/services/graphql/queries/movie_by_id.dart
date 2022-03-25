const movieById = r"""
  query ($id: UUID!) {
    movieById (id: $id) {
        imgUrl
        id
        movieDirectorByMovieDirectorId {
            name
            id
        }
        releaseDate
        title
        movieReviewsByMovieId {
            nodes {
                id
                body
                movieId
                title
                rating
                userByUserReviewerId {
                  id
                  name
                }   
            }
        }
    }
}
""";
