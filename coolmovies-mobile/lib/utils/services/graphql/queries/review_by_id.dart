const reviewById = r"""
   query ($id: UUID!){
      movieReviewById(id: $id) {
          body
          id
          rating
          title
          userReviewerId
          movieByMovieId {
              id
              title
          }
      }
}
""";
