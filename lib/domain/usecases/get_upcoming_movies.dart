import 'package:loadmore/domain/repositories/movies_repository.dart';
import '../entities/movies_entity.dart';

class GetUpcomingMovies {
  final MovieRepository repository;

  GetUpcomingMovies(this.repository);

  Future<List<MoviesEntity>> call() => repository.getUpcomingMovies();
}
