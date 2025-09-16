import 'package:loadmore/domain/entities/movies_entity.dart';
import 'cast_entity.dart';
import 'video_entity.dart';

class MoviesDetailEntity {
  final MoviesEntity movie;
  final List<VideoEntity> videos;
  final List<CastEntity> cast;
  final List<MoviesEntity> recommendations;

  const MoviesDetailEntity({
    required this.movie,
    required this.videos,
    required this.cast,
    required this.recommendations,
  });
}
