import 'package:loadmore/data/datasources/remote/movies_remo_datasource.dart';
import 'package:loadmore/domain/entities/actor_entity.dart';
import 'package:loadmore/domain/entities/cast_entity.dart';
import 'package:loadmore/domain/entities/genre_entity.dart';
import 'package:loadmore/domain/entities/language_entity.dart';
import 'package:loadmore/domain/entities/movie_detail_entity.dart';
import 'package:loadmore/domain/entities/movies_entity.dart';
import 'package:loadmore/domain/entities/video_entity.dart';
import 'package:loadmore/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MoviesEntity>> getPopularMovies() async {
    return await remoteDataSource.getPopularMovies();
  }

  @override
  Future<List<MoviesEntity>> getTopRatedMovies() async {
    return await remoteDataSource.getTopRatedMovies();
  }

  @override
  Future<List<MoviesEntity>> getUpcomingMovies() async {
    return await remoteDataSource.getUpcomingMovies();
  }

  @override
  Future<MovieDetailEntity> getMovieDetail(String movieId) async {
    return await remoteDataSource.getMovieDetail(movieId);
  }

  @override
  Future<List<CastEntity>> getCast(String movieId) async {
    return await remoteDataSource.getCast(movieId);
  }

  @override
  Future<List<VideoEntity>> getVideos(String movieId) async {
    return await remoteDataSource.getVideos(movieId);
  }

  @override
  Future<List<GenreEntity>> getGenres() async {
    return await remoteDataSource.getGenres();
  }

  @override
  Future<List<LanguageEntity>> getLanguages() async {
    return await remoteDataSource.getLanguages();
  }

  @override
  Future<List<ActorEntity>> getActors(String movieId) async {
    return await remoteDataSource.getActors(movieId);
  }

  @override
  Future<List<MoviesEntity>> searchMovies(String query) async {
    return await remoteDataSource.searchMovies(query);
  }

  @override
  Future<List<MoviesEntity>> filterMovies({
    List<String>? genreIds,
    List<String>? languageIds,
    DateTime? fromDate,
    DateTime? toDate,
    double? minRating,
  }) async {
    return await remoteDataSource.filterMovies(
      genreIds: genreIds,
      languageIds: languageIds,
      fromDate: fromDate,
      toDate: toDate,
      minRating: minRating,
    );
  }
}
