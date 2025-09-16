import 'package:loadmore/domain/repositories/movies_repository.dart';

import '../entities/movies_entity.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<MoviesEntity>> call() => repository.getPopularMovies();
}
