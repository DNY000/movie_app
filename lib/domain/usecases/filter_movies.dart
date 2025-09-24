import 'package:loadmore/domain/repositories/movies_repository.dart';
import '../entities/movies_entity.dart';

class FilterMovies {
  final MovieRepository repository;

  FilterMovies(this.repository);

  Future<List<MoviesEntity>> call({
    List<String>? genreIds,
    List<String>? languageIds,
    DateTime? fromDate,
    DateTime? toDate,
    double? minRating,
  }) => repository.filterMovies(
    genreIds: genreIds,
    languageIds: languageIds,
    fromDate: fromDate,
    toDate: toDate,
    minRating: minRating,
  );
}
