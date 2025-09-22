import 'package:loadmore/domain/entities/actor_entity.dart';
import 'package:loadmore/domain/entities/cast_entity.dart';
import 'package:loadmore/domain/entities/genre_entity.dart';
import 'package:loadmore/domain/entities/language_entity.dart';
import 'package:loadmore/domain/entities/movie_detail_entity.dart';
import 'package:loadmore/domain/entities/movies_entity.dart';
import 'package:loadmore/domain/entities/video_entity.dart';

abstract class MovieRepository {
  // Movie listings
  Future<List<MoviesEntity>> getPopularMovies();
  Future<List<MoviesEntity>> getTopRatedMovies();
  Future<List<MoviesEntity>> getUpcomingMovies();
  
  // Movie details
  Future<MovieDetailEntity> getMovieDetail(String movieId);
  Future<List<CastEntity>> getCast(String movieId);
  Future<List<VideoEntity>> getVideos(String movieId);
  
  // Movie metadata
  Future<List<GenreEntity>> getGenres();
  Future<List<LanguageEntity>> getLanguages();
  Future<List<ActorEntity>> getActors(String movieId);
  
  // Movie search
  Future<List<MoviesEntity>> searchMovies(String query);
  Future<List<MoviesEntity>> filterMovies({
    List<String>? genreIds,
    List<String>? languageIds,
    DateTime? fromDate,
    DateTime? toDate,
    double? minRating,
  });
}
