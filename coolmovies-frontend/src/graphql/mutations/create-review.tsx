import { gql } from '@apollo/client';

export const createMovieReview = gql`
  mutation ($input: CreateMovieReviewInput!){
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
`;