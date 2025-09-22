class BookingEntity {
  final String id;
  final String? userId;
  final String showtimeId;
  final DateTime bookingTime;
  final double totalAmount;
  final String status; // 'pending','paid','cancelled','expired'
  final String? promotionId;

  BookingEntity({
    required this.id,
    this.userId,
    required this.showtimeId,
    DateTime? bookingTime,
    this.totalAmount = 0,
    this.status = 'pending',
    this.promotionId,
  }) : bookingTime = bookingTime ?? DateTime.now();
}
