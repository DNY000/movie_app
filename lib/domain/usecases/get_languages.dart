import 'package:loadmore/domain/repositories/movies_repository.dart';
import '../entities/language_entity.dart';

class GetLanguages {
  final MovieRepository repository;

  GetLanguages(this.repository);

  Future<List<LanguageEntity>> call() => repository.getLanguages();
}
