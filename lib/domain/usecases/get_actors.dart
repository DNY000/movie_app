import 'package:loadmore/domain/repositories/movies_repository.dart';
import '../entities/actor_entity.dart';

class GetActors {
  final MovieRepository repository;

  GetActors(this.repository);

  Future<List<ActorEntity>> call(String movieId) => repository.getActors(movieId);
}
