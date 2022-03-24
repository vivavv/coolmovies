import { Epic, StateObservable } from 'redux-observable';
import { Observable } from 'rxjs';
import { filter, switchMap } from 'rxjs/operators';
import { allMovies } from '../../../graphql/queries/all-movies';
import { movieById } from '../../../graphql/queries/movie-by-id';
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
                return actions.moviesLoaded({ data: result.data.allMovies.nodes });
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
                        reviews: movie.movieReviewsByMovieId.nodes,
                    }
                });
            } catch (err) {
                return actions.detailLoadError();
            }
        })
    );
