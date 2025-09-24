import 'package:loadmore/domain/repositories/movies_repository.dart';
import '../entities/movies_entity.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<List<MoviesEntity>> call(String query) => repository.searchMovies(query);
}
