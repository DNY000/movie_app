import '../entities/movies_entity.dart';
import '../entities/movies_detail_entity.dart';

abstract class MovieRepository {
  Future<List<MoviesEntity>> getPopularMovies();
  Future<List<MoviesEntity>> getTopRatedMovies();
  Future<List<MoviesEntity>> getUpcomingMovies();
  Future<MoviesDetailEntity> getMovieDetail(int movieId);
}
