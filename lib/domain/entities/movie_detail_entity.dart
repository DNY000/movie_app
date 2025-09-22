import 'package:equatable/equatable.dart';
import 'package:loadmore/domain/entities/movies_entity.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final String title;
  final String? backdropPath;
  final String? posterPath;
  final String releaseDate;
  final num voteAverage;
  final String overview;
  final List<MoviesEntity>? recommendations;

  const MovieDetailEntity({
    required this.id,
    required this.title,
    this.backdropPath,
    this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.overview,
    this.recommendations,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        posterPath,
        releaseDate,
        voteAverage,
        overview,
      ];
}
