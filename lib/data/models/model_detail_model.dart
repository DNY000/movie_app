import 'package:loadmore/domain/entities/movies_detail_entity.dart';
import 'video_model.dart';
import 'cast_model.dart';
import 'movies_model.dart';

class MovieDetailModel extends MoviesDetailEntity {
  MovieDetailModel({
    required super.movie,
    required List<VideoModel> videos,
    required List<CastModel> cast,
    required super.recommendations,
  }) : super(
          videos: videos.map((v) => v.toEntity()).toList(),
          cast: cast.map((c) => c.toEntity()).toList(),
        );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    final movieModel = MoviesModel.fromJson(json);

    final videoModels = (json['videos']['results'] as List)
        .map((e) => VideoModel.fromJson(e))
        .toList();

    final castModels = (json['credits']['cast'] as List)
        .map((e) => CastModel.fromJson(e))
        .toList();

    final recommendations = (json['recommendations']['results'] as List)
        .map((e) => MoviesModel.fromJson(e).toEntity())
        .toList();

    return MovieDetailModel(
      movie: movieModel.toEntity(),
      videos: videoModels,
      cast: castModels,
      recommendations: recommendations,
    );
  }
}
