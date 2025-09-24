import 'package:loadmore/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show User;

class UserModel {
  final String id;
  final String email;
  final String name;
  final String? phone;
  final String role;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    this.role = 'customer',
  });

  factory UserModel.fromSupabaseUser(User user) {
    final metadata = user.userMetadata ?? {};
    return UserModel(
      id: user.id,
      email: user.email ?? '',
      name: (metadata['name'] as String?) ?? (metadata['full_name'] as String?) ?? '',
      phone: user.phone,
      role: (metadata['role'] as String?) ?? 'customer',
    );
  }

  UserEntity toEntity() => UserEntity(
        id: id,
        email: email,
        name: name,
        phone: phone,
        role: role,
      );
}


