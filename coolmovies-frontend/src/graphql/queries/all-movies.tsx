import { gql } from '@apollo/client';

export const allMovies = gql`
  query AllMovies {
    allMovies {
      nodes {
        id
        imgUrl
        title
        releaseDate
        nodeId
        userByUserCreatorId {
          id
          name
          nodeId
        }
        movieDirectorByMovieDirectorId {
          name
          id
        }
        movieReviewsByMovieId {
          nodes {
            rating
          }
        }
      }
    }
  }
`;