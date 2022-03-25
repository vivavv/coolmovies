/* eslint-disable @next/next/no-img-element */
import React, { FC } from 'react';
import { Card } from '@mui/material';
import { css } from '@emotion/react';
import { theme } from '../../styles/theme';
import { getRating } from '../../utils/get-rating';
import { FaStar } from 'react-icons/fa';
import { PageLink } from '../page-link';
import { Movie } from '../../helpers/interfaces';

interface Props {
    movie: Movie,
}

export const MovieCard: FC<Props> = ({ movie }) => {
    return <PageLink key={movie.id} route={`/movie/${movie.id}`}>
        <Card css={styles.movieCard}>
            <img src={movie.imgUrl} alt="poster"
                css={styles.moviePoster}
            />
            <div css={styles.movieTitle}>{movie.title}</div>
            <div css={styles.movieRatingContainer}>

                <div css={styles.movieRating}><FaStar />{getRating(movie.reviews)}</div>
            </div>

        </Card>
    </PageLink>
        ;
}

const styles = {
    movieCard: css({
        padding: '20px',
        backgroundColor: theme.colors.bubbleMedium,
        height: '325px',
        width: '200px',
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        flexDirection: 'column',
        transition: 'all ease 0.5s',

        ':hover': {
            cursor: 'pointer',
            backgroundColor: theme.colors.bubble,

            'div': {
                color: theme.colors.purple,
            }

        }
    }),
    moviePoster: css({
        height: '175px',
        width: '125px',
    }),
    movieTitle: css({
        color: theme.colors.text,
        marginTop: '20px',
        fontSize: '14px',
        fontWeight: 'bold',
        transition: 'color ease 0.5s'

    }),
    movieRating: css({
        fontSize: '12px',
        fontWeight: 'bold',
        display: 'flex',
        justifyContent: 'center',
        gap: '5px',
        color: theme.colors.gold
    }),
    movieRatingContainer: css({
        fontWeight: 'bold',
        color: theme.colors.text,
        backgroundColor: theme.colors.item,
        borderRadius: '10px',
        padding: '5px 10px',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: '10px',

    }),

};