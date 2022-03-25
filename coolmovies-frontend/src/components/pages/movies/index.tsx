import { css } from '@emotion/react';
import { useEffect } from 'react';
import { useAppDispatch, useAppSelector, moviesActions } from '../../../redux';
import { theme } from '../../../styles/theme';
import { MovieCard } from '../../MovieCard';

export const Movies = () => {
    const dispatch = useAppDispatch();
    const movies = useAppSelector((state) => state.movie);

    useEffect(() => {
        dispatch((moviesActions.fetch()));
    }, [dispatch]);


    return <div css={styles.container}>
        <div css={styles.moviesContainer}>
            {movies.moviesList?.map((movie) => {
                return <MovieCard key={movie.id} movie={movie} />
            }
            )}
        </div>
    </div>
}

const styles = {
    container: css({
        display: 'flex',
        flex: 1,
        backgroundColor: theme.colors.background,
        padding: '20px',
        minHeight: '100vh',
    }),
    moviesContainer: css({
        display: 'flex',
        flex: 1,
        flexWrap: 'wrap',
        justifyContent: 'space-between',
        gap: '10px',
    }),
};
