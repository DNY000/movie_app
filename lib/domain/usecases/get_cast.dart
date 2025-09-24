import 'package:loadmore/domain/repositories/movies_repository.dart';
import '../entities/cast_entity.dart';

class GetCast {
  final MovieRepository repository;

  GetCast(this.repository);

  Future<List<CastEntity>> call(String movieId) => repository.getCast(movieId);
}
