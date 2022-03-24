import { css } from '@emotion/react';
import type { NextPage } from 'next';
import { Key, useEffect } from 'react';
import { useAppDispatch, useAppSelector, moviesActions } from '../redux';
import {
  Card
} from '@mui/material';
import { PageLink } from '../components/PageLink';

const primary = '#1976d2';

const Home: NextPage = () => {
  const dispatch = useAppDispatch();
  const movies = useAppSelector((state) => state.movie);
  useEffect(() => {
    dispatch((moviesActions.fetch()));

  }, [dispatch]);

  return (
    <div css={styles.root}>
      {movies.moviesList?.map((movie) => {
        return <PageLink key={movie.id as Key} route={`/movie-detail/${movie.id}`}>
          <Card >
            {movie.title}
          </Card>
        </PageLink>
      }
      )}

    </div >
  );
};

const styles = {
  root: css({
    height: '100vh',
    width: '100%',
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
  }),
  navBar: css({
    background: primary,
    height: 50,
    alignSelf: 'stretch',
    display: 'flex',
    alignItems: 'center',
    padding: 16,
    borderRadius: 0,
    p: {
      color: 'white',
    },
  }),
  body: css({
    alignSelf: 'stretch',
    padding: 32,
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
  }),
  heading: css({ marginTop: 16, fontSize: '2.75rem', textAlign: 'center' }),
  subtitle: css({
    fontWeight: 300,
    textAlign: 'center',
    maxWidth: 600,
    margin: '24px 0',
    color: 'rgba(0, 0, 0, 0.6)',
  }),
  mainControls: css({
    display: 'flex',
    alignItems: 'center',
    button: { marginRight: 16 },
  }),
  dataInput: css({
    alignSelf: 'stretch',
    margin: '32px 0',
  }),
};

export default Home;
