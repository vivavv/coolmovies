/* eslint-disable @next/next/no-img-element */
import { css } from '@emotion/react';
import { useEffect } from 'react';
import { useAppDispatch, useAppSelector, moviesActions } from '../../../redux';
import { useRouter } from 'next/router';
import { theme } from '../../../styles/theme';
import { Card } from '@mui/material';
import { Rings } from 'react-loader-spinner';
import { getRating } from '../../../utils/get-rating';
import { FaStar, FaRegStar } from 'react-icons/fa';
import { ReviewCard } from '../../../components/ReviewCard';
import { PageLink } from '../../../components/PageLink';


export const Detail = () => {
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


    return (movie ? <div css={styles.container}>
        <Card css={styles.movieContainer}>
            <img src={movie.imgUrl} alt="poster"
                css={styles.moviePoster}
            />
            <div css={styles.movieInfoContainer}>
                <div css={styles.movieInfo}>
                    <div css={styles.movieTitle}>{movie?.title}</div>
                    <div css={styles.movieDirector}>{movie?.director}</div>
                    <div css={styles.movieDate}>{movie?.releaseDate.slice(0, 4)}</div>
                </div>
                <div css={styles.movieRatingContainer}>
                    <div>Rating</div>
                    <div css={styles.movieRating}><FaStar />{getRating(movie?.reviews)}</div>
                    <div css={styles.totalReviews}>{`${movie?.reviews.length} reviews`}</div>
                </div>
            </div>
        </Card>
        <PageLink route={`/movie/${id}/review`}>
            <div css={styles.addRating}>
                <FaRegStar /> Add a review
            </div>
        </PageLink>
        <div css={styles.movieReviews}>
            {reviews?.map((review) => <ReviewCard key={review.id} review={review} />)}
        </div>
    </div>
        : <div css={styles.containerEmpty}>
            <Rings
                height="100"
                width="100"
                color='#c7c7c7'
                ariaLabel='loading'
            />
        </div>
    );
}

const styles = {
    container: css({
        width: '100%',
        minHeight: '100vh',
        display: 'flex',
        flex: 1,
        flexDirection: 'column',
        backgroundColor: theme.colors.background,
        padding: '20px'
    }),
    containerEmpty: css({
        height: '100vh',
        width: '100%',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        flexDirection: 'column',
        backgroundColor: theme.colors.background,
        padding: '20px'
    }),
    movieContainer: css({
        display: 'flex',
        gap: '20px',
        padding: '10px',
        borderRadius: '10px',
        backgroundColor: theme.colors.bubble,

    }),
    movieInfoContainer: css({
        display: 'flex',
        flexDirection: 'column',
        gap: '20px',
        flex: 1,
        justifyContent: 'space-between'
    }),
    moviePoster: css({
        height: '250px',
        width: '175px',
    }),
    movieInfo: css({
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        gap: '10px',
        marginTop: '20px',
    }),
    movieTitle: css({
        fontSize: '22px',
        fontWeight: 'bold',
        color: theme.colors.text,
    }),
    movieDirector: css({
        fontSize: '18px',
        color: theme.colors.purple,
    }),
    movieDate: css({
        fontSize: '14px',
        fontWeight: 'bold',
        backgroundColor: theme.colors.header,
        color: 'white',
        borderRadius: '10px',
        width: '70px',
        display: 'flex',
        justifyContent: 'center',
        gap: '5px',
        padding: '2px 0px',
        marginTop: '10px',
    }),
    movieRatingContainer: css({
        fontWeight: 'bold',
        color: theme.colors.text,
        backgroundColor: theme.colors.bubbleMedium,
        borderRadius: '10px',
        width: '100%',
        height: '75px',
        display: 'flex',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: '20px',
        marginRight: '20px',

    }),
    movieRating: css({
        marginTop: '10px',
        fontSize: '18px',
        fontWeight: 'bold',
        display: 'flex',
        justifyContent: 'center',
        gap: '5px',
        color: theme.colors.gold
    }),
    totalReviews: css({
        fontSize: '10px',
        fontWeight: 'normal',
        color: theme.colors.textDark
    }),
    addRating: css({
        backgroundColor: theme.colors.header,
        color: theme.colors.purple,
        padding: '20px',
        borderRadius: '10px',
        fontWeight: 'bold',
        fontSize: '16px',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        gap: '10px',
        margin: '20px 0px',
        transition: 'all ease 0.5s',

        ':hover': {
            backgroundColor: '#0e0d13',
            color: theme.colors.text,
            cursor: 'pointer',
        }
    }),
    movieReviews: css({
        backgroundColor: theme.colors.header,
        color: theme.colors.purple,
        padding: '20px',
        borderRadius: '10px',
        fontWeight: 'bold',
        fontSize: '16px',
        display: 'flex',
        flexDirection: 'column',
        flex: 1,
        gap: '10px',
        overflow: 'scroll',
        '::-webkit-scrollbar': {
            display: 'none',
        }

    }),

};