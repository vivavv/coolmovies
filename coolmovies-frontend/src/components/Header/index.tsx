import React, { useEffect } from 'react';
import { css } from '@emotion/react';
import { theme } from '../../styles/theme';
import MoviesIcon from '../../assets/icons/movies.svg';
import { FaUserCircle } from 'react-icons/fa';
import { PageLink } from '../PageLink';
import { moviesActions, useAppDispatch, useAppSelector } from '../../redux';

export const Header = () => {
    const dispatch = useAppDispatch();
    const movies = useAppSelector((state) => state.movie);

    useEffect(() => {
        dispatch((moviesActions.fetchUser()));
    }, [dispatch]);

    return <div css={styles.header} >
        <div css={styles.headerInfo} >
            <div css={styles.headerIcon} ><MoviesIcon /></div>
            <PageLink route="/">
                <div css={styles.headerTitle}>Coolmovies</div>
            </PageLink>
        </div>
        <div css={styles.headerInfo} >
            <div css={styles.headerUser}>{movies.user?.name}</div> <FaUserCircle />
        </div>
    </div >;
}

const styles = {
    header: css({
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        backgroundColor: theme.colors.header,
        position: 'sticky',
        top: 0,
        height: '40px',
        padding: '0px 20px'
    }),
    headerTitle: css({
        color: theme.colors.text,
        padding: '10px',
        fontWeight: 'bold',
        transition: 'color 0.5s ease',

        ':hover': {
            color: theme.colors.purple,
            cursor: 'pointer',
        }
    }),
    headerIcon: css({
        height: '22px',
        width: '22px',
        marginBottom: '4px'
    }),
    headerInfo: css({
        display: 'flex',
        alignItems: 'center',
        color: theme.colors.text,
    }),
    headerUser: css({
        fontSize: '14px',
        margin: '0px 10px'
    }),
};