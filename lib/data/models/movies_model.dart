import 'package:loadmore/domain/entities/movies_entity.dart';

class MoviesModel extends MoviesEntity {
  const MoviesModel({
    required super.id,
    required super.title,
    super.description,
    super.trailerUrl,
    super.trailerYoutubeUrl,
    super.posterUrl,
    super.releaseDate,
    super.durationMinutes,
    super.rating = 0,
    super.actors = const [],
    super.genres = const [],
    super.languages = const [],
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      description: json['overview'],
      posterUrl: json['poster_path'] != null 
        ? 'https://image.tmdb.org/t/p/w500${json['poster_path']}'
        : null,
      trailerUrl: json['video_url'],
      trailerYoutubeUrl: json['video_key'] != null 
        ? 'https://www.youtube.com/watch?v=${json['video_key']}'
        : null,
      releaseDate: json['release_date'] != null 
        ? DateTime.parse(json['release_date']) 
        : null,
      durationMinutes: json['runtime'],
      rating: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      actors: const [], // Will be populated separately
      genres: const [], // Will be populated separately
      languages: const [], // Will be populated separately
    );
  }


}
