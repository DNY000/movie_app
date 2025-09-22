class ActorEntity {
  final String id;
  final String name;
  final String roleType; // 'main' | 'supporting'

  const ActorEntity({
    required this.id,
    required this.name,
    this.roleType = 'supporting',
  });
}
