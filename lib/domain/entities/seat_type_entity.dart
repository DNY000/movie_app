class SeatTypeEntity {
  final int id;
  final String code; // 'standard', 'vip', 'couple', 'sofabox'
  final String? description;

  SeatTypeEntity({
    required this.id,
    required this.code,
    this.description,
  });
}
