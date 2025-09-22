import 'package:loadmore/domain/entities/actor_entity.dart';

class ActorModel extends ActorEntity {
  const ActorModel({
    required super.id,
    required super.name,
    super.roleType = 'supporting',
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      id: json['id'].toString(),
      name: json['name'],
      roleType: json['role_type'] ?? 'supporting',
    );
  }
}
