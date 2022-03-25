export interface Movie {
    id: string;
    imgUrl: string;
    title: string;
    releaseDate: string;
    director: Director;
    reviews: MovieReview[];
}

export interface Director {
    name: string;
}

export interface User {
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

export interface Review {
    title: string,
    body: string,
    rating: number,
    movieId: string,
    movieTitle?: string,
    userReviewerId: string,
}

export interface ReviewForm {
    title: string,
    rating: number,
    comments: string,
}

