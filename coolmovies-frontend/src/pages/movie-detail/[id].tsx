import { css } from '@emotion/react';
import type { NextPage } from 'next';
import { useEffect } from 'react';
import { useAppDispatch, useAppSelector, moviesActions } from '../../redux';
import { useRouter } from 'next/router';

const primary = '#1976d2';

const MovieDetail: NextPage = () => {
    const dispatch = useAppDispatch();
    const movies = useAppSelector((state) => state.movie);
    const movie = movies.movieDetail;
    const reviews = movies.movieDetail?.reviews;
    const router = useRouter();
    const id = router.query.id as string | undefined;

    useEffect(() => {
        if (id) {
            dispatch((moviesActions.fetchDetail({ id })));
        }
    }, [dispatch, id]);

    return (
        <div css={styles.root}>
            {movie?.title ?? 'hola'}
            {reviews?.map((review) => <div key={review.id}>{review.title}</div>)}
            {console.log(reviews)}
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

export default MovieDetail;
