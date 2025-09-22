import 'package:loadmore/domain/entities/cast_entity.dart';

class CastModel extends CastEntity {
  const CastModel({
    required super.id,
    required super.name,
    required super.character,
    required super.profilePath,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      profilePath: json['profile_path'] ?? '',
    );
  }
}
