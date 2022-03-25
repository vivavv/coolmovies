import React, { FC } from 'react';
import { Card } from '@mui/material';
import { css } from '@emotion/react';
import { theme } from '../../styles/theme';
import { FaStar } from 'react-icons/fa';
import EditIcon from '../../assets/icons/edit.svg';
import { PageLink } from '../page-link';
import { MovieReview } from '../../helpers/interfaces';

interface Props {
    review: MovieReview,
    hasReview?: boolean,
    userId: string,
}

export const ReviewCard: FC<Props> = ({ review, hasReview, userId }) => {
    return <Card css={styles.reviewCard}>
        <div css={styles.reviewHeader}>
            <div css={styles.reviewInfo} >
                <div css={styles.reviewRating}><FaStar />{review.rating}</div>
                <div css={styles.reviewTitle} >{review.title}</div>
            </div>
            {(hasReview && review.reviewer.id === userId) && <PageLink route={`/movie/${review.movieId}/review/${review.id}`}><div css={styles.reviewEdit}>Edit review <EditIcon css={styles.reviewIcon} /></div></PageLink>}
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
        justifyContent: 'space-between'
    }),
    reviewInfo: css({
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
        color: theme.colors.gold
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
    }),
    reviewEdit: css({
        color: theme.colors.green,
        fontSize: '14px',
        fontWeight: 'normal',
        display: 'flex',
        alignItems: 'center',
        transition: 'color ease 0.5s',

        ':hover': {
            cursor: 'pointer',
            color: '#1e7962',

            'svg': {
                fill: '#1e7962'
            }
        }
    }),
    reviewIcon: css({
        fill: theme.colors.green,
        marginLeft: '5px',
        transition: 'fill ease 0.5s',

    })

};