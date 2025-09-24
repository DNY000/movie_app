import 'package:loadmore/domain/repositories/movies_repository.dart';
import '../entities/video_entity.dart';

class GetVideos {
  final MovieRepository repository;

  GetVideos(this.repository);

  Future<List<VideoEntity>> call(String movieId) => repository.getVideos(movieId);
}
