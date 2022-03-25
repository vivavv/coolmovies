export { actions as moviesActions } from './slice';
export { default as moviesReducer } from './slice';
import { combineEpics } from 'redux-observable';
import { addMovieReviewEpic, fetchMoviesEpic, fetchUserEpic, getMovieDetailEpic } from './epics';

export const movieEpics = combineEpics(fetchMoviesEpic, getMovieDetailEpic, addMovieReviewEpic, fetchUserEpic);
