import { gql } from '@apollo/client';

export const getCurrentUser = gql`
  query CurrentUser {
    currentUser {
        id
        name
    }
  }
`;