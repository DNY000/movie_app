class UserEntity {
  final String id;
  final String email;
  final String name;
  final String? phone;
  final String? passwordHash;
  final String role; // 'customer', 'staff', 'admin'

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    this.passwordHash,
    this.role = 'customer',
  });
}
