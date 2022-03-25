import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { Movie, Review, User } from '../../../helpers/interfaces';

interface MovieState {
    movieDetail?: Movie;
    moviesList?: Movie[];
    user?: User;
    review?: Review;
    reviewError: string;
}

const initialState: MovieState = {
    reviewError: '',
};

export const slice = createSlice({
    initialState,
    name: 'movie',
    reducers: {
        fetch: () => { },
        fetchDetail: (state, action: PayloadAction<{ id: string }>) => { },
        clearData: (state) => {
            state.moviesList = undefined;
        },
        moviesLoaded: (state, action: PayloadAction<{ data: Movie[] }>) => {
            state.moviesList = action.payload.data;
        },
        moviesLoadError: (state) => {
            state.moviesList = [];
        },
        detailLoaded: (state, action: PayloadAction<{ data: Movie }>) => {
            state.movieDetail = action.payload.data;
        },
        detailLoadError: (state) => {
            state.movieDetail = undefined;
        },
        createReview: (state, action: PayloadAction<{ review: Review }>) => { },
        createReviewError: (state) => {
            state.reviewError = 'Error';
        },
        fetchUser: () => { },
        userLoaded: (state, action: PayloadAction<{ data: User }>) => {
            state.user = action.payload.data;
        },
        userLoadError: (state) => {
            state.user = { name: 'User', id: '' } as User;
        },
        fetchReview: (state, action: PayloadAction<{ id: string }>) => { },
        reviewLoaded: (state, action: PayloadAction<{ data: Review }>) => {
            state.review = action.payload.data;
        },
        reviewLoadError: (state) => {
            state.review = {} as Review;
        },





    },
});

export const { actions } = slice;
export type SliceAction = typeof actions;
export default slice.reducer;
