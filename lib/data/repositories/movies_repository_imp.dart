import 'package:loadmore/data/datasources/remote/movies_remo_datasource.dart';
import 'package:loadmore/domain/entities/movies_entity.dart';
import 'package:loadmore/domain/entities/movies_detail_entity.dart';
import 'package:loadmore/domain/repositories/movies_repository.dart';


class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MoviesEntity>> getPopularMovies() async {
    final models = await remoteDataSource.getPopularMovies();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<MoviesEntity>> getTopRatedMovies() async {
    final models = await remoteDataSource.getTopRatedMovies();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<MoviesEntity>> getUpcomingMovies() async {
    final models = await remoteDataSource.getUpcomingMovies();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<MoviesDetailEntity> getMovieDetail(int movieId) async {
    final model = await remoteDataSource.getMovieDetail(movieId);
    return model;
  }
}
