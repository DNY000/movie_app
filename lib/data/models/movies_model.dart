import 'package:loadmore/domain/entities/movies_entity.dart';

class MoviesModel extends MoviesEntity {
  const MoviesModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backdropPath,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json['id'],
        title: json['title'] ?? '',
        overview: json['overview'] ?? '',
        posterPath: json['poster_path'] ?? '',
        backdropPath: json['backdrop_path'] ?? '',
        voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
        releaseDate: json['release_date'] ?? '',
      );

  MoviesEntity toEntity() => MoviesEntity(
        id: id,
        title: title,
        overview: overview,
        posterPath: posterPath,
        backdropPath: backdropPath,
        voteAverage: voteAverage,
        releaseDate: releaseDate,
      );
}
