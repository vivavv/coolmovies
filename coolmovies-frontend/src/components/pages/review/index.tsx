import { css } from '@emotion/react';
import { useAppDispatch, useAppSelector, moviesActions } from '../../../redux';
import { theme } from '../../../styles/theme';
import { FaStar } from 'react-icons/fa';
import { useForm, Controller } from 'react-hook-form';
import { useEffect } from 'react';
import { useRouter } from 'next/router';
import { Button, Card, TextField } from '@mui/material';
import { BiArrowBack } from 'react-icons/bi';
import { PageLink } from '../../page-link';
import { ReviewForm } from '../../../helpers/interfaces';
import * as yup from "yup";
import { yupResolver } from "@hookform/resolvers/yup";

const schema = yup.object().shape({
    rating: yup.number().min(1).max(3).required(),
    title: yup.string().min(1).max(30).required(),
    comments: yup.string().min(1).max(300).required(),
});

export const Review = () => {
    const dispatch = useAppDispatch();
    const movies = useAppSelector((state) => state.movie);
    const movie = movies.movieDetail;
    const router = useRouter();
    const id = router.query.id as string | undefined;
    const { handleSubmit, control, formState } = useForm<ReviewForm>({
        resolver: yupResolver(schema),
    });

    useEffect(() => {
        if (id) {
            dispatch((moviesActions.fetchDetail({ id })));
        }
    }, [dispatch, id]);


    const onSubmit = handleSubmit((data) => {
        dispatch((moviesActions.createReview({
            review: {
                title: data.title,
                body: data.comments,
                rating: data.rating,
                movieId: id!,
                userReviewerId: movie!.reviews[movie!.reviews.length - 1].id
            }
        })));

    });

    return (<form onSubmit={onSubmit}><div css={styles.container}><Card css={styles.form}>
        <div css={styles.formTitle}>Add Review</div>
        <div css={styles.formBody}>
            <div>
                <div css={styles.movieDetail}>
                    <PageLink route={`/movie/${id}`}>
                        <div css={styles.movieLink}><BiArrowBack /></div>
                    </PageLink>
                    <div css={styles.movieTitle}>{movie?.title}</div>
                </div>
                <div css={styles.formItem}>
                    <div css={styles.favorite}>
                        <FaStar />
                        <div css={styles.label}> Rating</div>
                    </div>
                    <Controller
                        name="rating"
                        control={control}
                        defaultValue={10}
                        render={({ field: { onChange, value }, fieldState: { error } }) => (
                            <TextField variant='standard'
                                maxRows={1}
                                sx={{
                                    input: { color: theme.colors.text, backgroundColor: theme.colors.background },
                                    '& .MuiInput-underline:before': { borderBottomColor: theme.colors.header, borderBottomWidth: '2px', },
                                    '& .MuiInput-underline:after': { borderBottomColor: theme.colors.purple },
                                    '&:focus': { backgroundColor: 'red' }
                                }}
                                type="number"
                                inputProps={{ min: 1, max: 10 }}
                                style={{ width: '150px', marginBottom: '30px' }}
                                onChange={onChange}
                                value={value}
                                error={!!error}
                                helperText={error ? error.message : null}
                            />
                        )}
                    />
                    <div css={styles.formItem}>
                        <div css={styles.label}>Title</div>
                        <Controller
                            name="title"
                            control={control}
                            defaultValue=""
                            render={({ field: { onChange, value }, fieldState: { error } }) => (
                                <TextField variant='standard'
                                    maxRows={1}
                                    sx={{
                                        input: { color: theme.colors.text },
                                        '& .MuiInput-underline:before': { borderBottomColor: theme.colors.header, borderBottomWidth: '2px' },
                                        '& .MuiInput-underline:after': { borderBottomColor: theme.colors.purple },
                                    }}
                                    inputProps={{ maxLength: 30 }}
                                    style={{ marginBottom: '30px' }}
                                    onChange={onChange}
                                    value={value}
                                    error={!!error}
                                    helperText={error ? error.message : null}
                                />
                            )}

                        />
                    </div>

                </div>
                <div css={styles.formItem}>
                    <div css={styles.label}>Comments</div>
                    <Controller
                        name="comments"
                        control={control}
                        defaultValue=""
                        render={({ field: { onChange, value }, fieldState: { error } }) => (
                            <TextField variant='standard'
                                rows={3}
                                multiline
                                sx={{
                                    textarea: { color: theme.colors.text, overflow: 'hidden' },
                                    '& .MuiInput-underline:before': { borderBottomColor: theme.colors.header, borderBottomWidth: '2px' },
                                    '& .MuiInput-underline:after': { borderBottomColor: theme.colors.purple },
                                }}
                                style={{ marginBottom: '30px' }}
                                inputProps={{ maxLength: 300 }}
                                onChange={onChange}
                                value={value}
                                error={!!error}
                                helperText={error ? error.message : null}
                            />
                        )}
                    />
                </div>
            </div>
            <Button variant="contained"
                type="submit"
                style={{
                    backgroundColor: theme.colors.purple,
                    color: theme.colors.bubbleDark,
                }}
            >Add review</Button>
        </div>
    </Card ></div >
    </form >
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
    form: css({
        display: 'flex',
        flex: 1,
        flexDirection: 'column',
        padding: '20px',
        backgroundColor: theme.colors.bubbleMedium,
    }),
    formTitle: css({
        fontSize: '20px',
        fontWeight: 'bold',
        color: theme.colors.text,
        backgroundColor: theme.colors.header,
        width: '100%',
        height: '40px',
        padding: '10px',
        borderTopLeftRadius: '4px',
        borderTopRightRadius: '4px',
        textAlign: 'center'
    }),
    formBody: css({
        display: 'flex',
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'space-between',
        padding: '20px',
        backgroundColor: theme.colors.background,
    }),
    movieDetail: css({
        display: 'flex',
        justifyContent: 'center',
    }),
    movieTitle: css({
        fontSize: '20px',
        fontWeight: 'bold',
        color: theme.colors.textDark,
        padding: '5px 10px',
        textAlign: 'center',
        marginBottom: '30px'
    }),
    movieLink: css({
        backgroundColor: theme.colors.purple,
        borderRadius: '10px',
        height: '20px',
        padding: '2px',
        marginTop: '6px',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        transition: 'all ease 0.5s',

        ':hover': {
            cursor: 'pointer',
            backgroundColor: '#784cbc',
        }

    }),
    formItem: css({
        display: 'flex',
        flexDirection: 'column',
    }),
    label: css({
        fontSize: '16px',
        fontWeight: 'bold',
        color: theme.colors.purple,
        marginBottom: '5px',
    }),
    favorite: css({
        display: 'flex',
        gap: '10px',
        color: theme.colors.gold
    })

};