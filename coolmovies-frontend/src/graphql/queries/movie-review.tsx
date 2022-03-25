import { gql } from '@apollo/client';

export const movieReviewById = gql`
  query MovieReviewById ($id: UUID!){
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
`;