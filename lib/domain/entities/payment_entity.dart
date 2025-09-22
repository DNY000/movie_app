class PaymentEntity {
  final String id;
  final String bookingId;
  final String? userId;
  final double amount;
  final String method; // 'momo','zalopay','stripe','cash'
  final String? provider;
  final String status; // 'pending','success','failed','refunded'
  final String? transactionId;

  PaymentEntity({
    required this.id,
    required this.bookingId,
    this.userId,
    required this.amount,
    required this.method,
    this.provider,
    this.status = 'pending',
    this.transactionId,
  });
}
