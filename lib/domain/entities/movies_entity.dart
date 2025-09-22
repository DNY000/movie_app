

import 'package:loadmore/domain/entities/actor_entity.dart';
import 'package:loadmore/domain/entities/genre_entity.dart';
import 'package:loadmore/domain/entities/language_entity.dart';

class MoviesEntity {
  final String id;
  final String title;
  final String? description;
  final String? trailerUrl;
  final String? trailerYoutubeUrl;
  final String? posterUrl;
  final DateTime? releaseDate;
  final int? durationMinutes;
  final double rating;

  final List<ActorEntity> actors;
  final List<GenreEntity> genres;
  final List<LanguageEntity> languages;

  const MoviesEntity({
    required this.id,
    required this.title,
    this.description,
    this.trailerUrl,
    this.trailerYoutubeUrl,
    this.posterUrl,
    this.releaseDate,
    this.durationMinutes,
    this.rating = 0,
    this.actors = const [],
    this.genres = const [],
    this.languages = const [],
  });
}
