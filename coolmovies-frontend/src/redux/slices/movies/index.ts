export { actions as moviesActions } from './slice';
export { default as moviesReducer } from './slice';
import { combineEpics } from 'redux-observable';
import { addMovieReview, fetchMoviesEpic, getMovieDetailEpic } from './epics';

export const movieEpics = combineEpics(fetchMoviesEpic, getMovieDetailEpic, addMovieReview);
