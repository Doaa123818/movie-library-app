class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

const List<Movie> movies = [
  Movie(title: 'Interstellar', genre: 'Sci-Fi', year: 2014, rating: 8.7, image: 'assets/posters/interstellar.png'),
  Movie(title: 'The Dark Knight', genre: 'Action', year: 2008, rating: 9.0, image: 'assets/posters/dark_knight.png'),
  Movie(title: 'Inception', genre: 'Thriller', year: 2010, rating: 8.8, image: 'assets/posters/inception.png'),
  Movie(title: 'Coco', genre: 'Animation', year: 2017, rating: 8.4, image: 'assets/posters/coco.png'),
  Movie(title: 'The Martian', genre: 'Adventure', year: 2015, rating: 8.0, image: 'assets/posters/martian.png'),
  Movie(title: 'Joker', genre: 'Drama', year: 2019, rating: 8.4, image: 'assets/posters/joker.png'),
  Movie(title: 'Black Panther', genre: 'Action', year: 2018, rating: 7.3, image: 'assets/posters/black_panther.png'),
  Movie(title: 'Finding Nemo', genre: 'Animation', year: 2003, rating: 8.2, image: 'assets/posters/finding_nemo.png'),
];
