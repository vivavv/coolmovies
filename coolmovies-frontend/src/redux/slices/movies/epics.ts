import { Epic, StateObservable } from 'redux-observable';
import { Observable } from 'rxjs';
import { filter, switchMap } from 'rxjs/operators';
import { createMovieReview } from '../../../graphql/mutations/create-review';
import { allMovies } from '../../../graphql/queries/all-movies';
import { movieById } from '../../../graphql/queries/movie-by-id';
import { getCurrentUser } from '../../../graphql/queries/user';
import { RootState } from '../../store';
import { EpicDependencies } from '../../types';
import { actions, SliceAction } from './slice';


export const fetchMoviesEpic: Epic = (
    action$: Observable<SliceAction['fetch']>,
    state$: StateObservable<RootState>,
    { client }: EpicDependencies
) =>
    action$.pipe(
        filter(actions.fetch.match),
        switchMap(async () => {
            try {
                const result = await client.query({
                    query: allMovies,
                });

                const movies = result.data.allMovies.nodes;

                return actions.moviesLoaded({
                    data: (movies as any[]).map((movie) => {
                        return {
                            id: movie.id,
                            imgUrl: movie.imgUrl,
                            title: movie.title,
                            releaseDate: movie.releaseDate,
                            director: movie.movieDirectorByMovieDirectorId,
                            reviews: (movie.movieReviewsByMovieId.nodes as any[]).map((node) => {
                                return {
                                    id: node.id,
                                    movieId: node.movieId,
                                    rating: node.rating,
                                    title: node.title,
                                    body: node.body,
                                    reviewer: node.userByUserReviewerId
                                }
                            }),
                        }
                    })
                });
            } catch (err) {
                return actions.moviesLoadError();
            }
        })
    );

export const getMovieDetailEpic: Epic = (
    action$: Observable<SliceAction['fetchDetail']>,
    state$: StateObservable<RootState>,
    { client }: EpicDependencies
) =>
    action$.pipe(
        filter(actions.fetchDetail.match),
        switchMap(async (action) => {
            try {
                const result = await client.query({
                    query: movieById,
                    variables: { id: action.payload.id }
                });

                const movie = result.data.movieById;

                return actions.detailLoaded({
                    data: {
                        id: movie.id,
                        imgUrl: movie.imgUrl,
                        title: movie.title,
                        releaseDate: movie.releaseDate,
                        director: movie.movieDirectorByMovieDirectorId.name,
                        reviews: (movie.movieReviewsByMovieId.nodes as any[]).map((node) => {
                            return {
                                id: node.id,
                                movieId: node.movieId,
                                rating: node.rating,
                                title: node.title,
                                body: node.body,
                                reviewer: node.userByUserReviewerId
                            }
                        })
                    }
                });
            } catch (err) {
                return actions.detailLoadError();
            }
        })
    );

export const addMovieReviewEpic: Epic = (
    action$: Observable<SliceAction['createReview']>,
    state$: StateObservable<RootState>,
    { client }: EpicDependencies
) =>
    action$.pipe(
        filter(actions.createReview.match),
        switchMap(async (action) => {
            try {
                const result = await client.mutate({
                    mutation: createMovieReview,
                    variables: {
                        input: { movieReview: action.payload.review }
                    }
                });

                console.log('result', result);

                return action;

            } catch (err) {
                console.log(err);
                return actions.createReviewError();
            }
        })
    );

export const fetchUserEpic: Epic = (
    action$: Observable<SliceAction['fetchUser']>,
    state$: StateObservable<RootState>,
    { client }: EpicDependencies
) =>
    action$.pipe(
        filter(actions.fetchUser.match),
        switchMap(async () => {
            try {
                const result = await client.query({
                    query: getCurrentUser,
                });

                return actions.userLoaded({ data: result.data.currentUser });
            } catch (err) {
                return actions.userLoadError();
            }
        })
    );
