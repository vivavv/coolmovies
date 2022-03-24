import React, { FC } from 'react';
import { MovieReview } from '../../redux/slices/movies/slice';
import { Card } from '@mui/material';
import { css } from '@emotion/react';
import { theme } from '../../styles/theme';
import { FaStar } from 'react-icons/fa';

interface Props {
    review: MovieReview,
}

export const ReviewCard: FC<Props> = ({ review }) => {
    return <Card css={styles.reviewCard}>
        <div css={styles.reviewHeader}>
            <div css={styles.reviewRating}><FaStar />{review.rating}</div>
            <div css={styles.reviewTitle} >{review.title}</div>
        </div>
        <div css={styles.reviewer}>{review.reviewer.name}</div>
        <div css={styles.reviewBody}>{review.body}</div>

    </Card>;
}

const styles = {
    reviewCard: css({
        padding: '20px',
        backgroundColor: theme.colors.bubbleMedium,
        minHeight: '150px',
    }),
    reviewHeader: css({
        display: 'flex',
        gap: '20px',
    }),
    reviewTitle: css({
        fontWeight: 'bold',
        fontSize: '16px',
        color: theme.colors.text,

    }),
    reviewRating: css({
        display: 'flex',
        gap: '5px',
        color: '#f7ca18'
    }),
    reviewer: css({
        fontSize: '14px',
        color: theme.colors.purple,
        margin: '5px 0px'
    }),
    reviewBody: css({
        fontSize: '14px',
        fontWeight: 'normal',
        color: theme.colors.text,
        marginTop: '10px',

    })

};