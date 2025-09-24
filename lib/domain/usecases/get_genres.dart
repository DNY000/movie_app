import 'package:loadmore/domain/repositories/movies_repository.dart';
import '../entities/genre_entity.dart';

class GetGenres {
  final MovieRepository repository;

  GetGenres(this.repository);

  Future<List<GenreEntity>> call() => repository.getGenres();
}
