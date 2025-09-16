import 'package:loadmore/domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  const VideoModel({
    required super.id,
    required super.key,
    required super.name,
    required super.site,
    required super.type,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json['id'] ?? '',
        key: json['key'] ?? '',
        name: json['name'] ?? '',
        site: json['site'] ?? '',
        type: json['type'] ?? '',
      );

  VideoEntity toEntity() => VideoEntity(
        id: id,
        key: key,
        name: name,
        site: site,
        type: type,
      );
}
