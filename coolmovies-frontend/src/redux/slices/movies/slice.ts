import { createSlice, PayloadAction } from '@reduxjs/toolkit';

interface Movie {
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

interface MovieReview {
    id: string;
    movieId: string;
    rating: number;
    title: string;
    body: string;
    userId: string;
}

interface MovieState {
    movieDetail?: Movie;
    moviesList?: Movie[];
}

const initialState: MovieState = {
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


    },
});

export const { actions } = slice;
export type SliceAction = typeof actions;
export default slice.reducer;
