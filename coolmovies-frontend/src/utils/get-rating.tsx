import { MovieReview } from "../redux/slices/movies/slice";

export const getRating = (reviews: MovieReview[]) => {
    const result =
        reviews!.map((review) => review.rating).reduce((a, b) => a + b);

    return (result / reviews.length).toFixed(2);
}

