import 'package:loadmore/domain/repositories/movies_repository.dart';
import '../entities/movies_entity.dart';

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<List<MoviesEntity>> call() => repository.getTopRatedMovies();
}
