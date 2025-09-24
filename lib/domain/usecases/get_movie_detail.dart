import 'package:loadmore/domain/repositories/movies_repository.dart';
import '../entities/movie_detail_entity.dart';

class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<MovieDetailEntity> call(String movieId) => repository.getMovieDetail(movieId);
}
