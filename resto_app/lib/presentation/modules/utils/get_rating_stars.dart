/// check is rating double(int) or double,
/// ```
/// getRatingStars(3.7) return 3.5
/// getRatingStars(3.0) return 3.0
/// ```
double getRatingStars(double rating) =>
    (rating % 1 != 0) ? rating.floorToDouble() + 0.5 : rating;
