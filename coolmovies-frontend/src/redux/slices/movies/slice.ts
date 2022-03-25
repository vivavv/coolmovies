import { createSlice, PayloadAction } from '@reduxjs/toolkit';
import { Review } from '../../../pages/movie/[id]/review';

export interface Movie {
    id: string;
    imgUrl: string;
    title: string;
    releaseDate: string;
    director: Director;
    reviews: MovieReview[];
}

interface Director {
    name: string;
}

interface Director {
    name: string;
}

interface User {
    id: string,
    name: string,
}
export interface MovieReview {
    id: string;
    movieId: string;
    rating: number;
    title: string;
    body: string;
    reviewer: User;
}
interface MovieState {
    movieDetail?: Movie;
    moviesList?: Movie[];
    user?: User;
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




    },
});

export const { actions } = slice;
export type SliceAction = typeof actions;
export default slice.reducer;
