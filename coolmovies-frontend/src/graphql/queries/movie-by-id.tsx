import { gql } from '@apollo/client';

export const movieById = gql`
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
                userReviewerId
            }
        }
    }
  }
`;