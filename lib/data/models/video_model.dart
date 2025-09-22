import 'package:loadmore/domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  const VideoModel({
    required super.title,
    required super.key,
    required super.type,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      title: json['name'],
      key: json['key'],
      type: json['type'],
    );
  }
}
