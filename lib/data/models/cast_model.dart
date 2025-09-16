import 'package:loadmore/domain/entities/cast_entity.dart';

class CastModel extends CastEntity {
  const CastModel({
    required super.id,
    required super.name,
    required super.character,
    required super.profilePath,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        id: json['id'],
        name: json['name'] ?? '',
        character: json['character'] ?? '',
        profilePath: json['profile_path'] ?? '',
      );

  CastEntity toEntity() => CastEntity(
        id: id,
        name: name,
        character: character,
        profilePath: profilePath,
      );
}
