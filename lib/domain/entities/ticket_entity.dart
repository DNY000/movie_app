class TicketEntity {
  final String id;
  final String bookingId;
  final String showtimeId;
  final String seatId;
  final double price;

  TicketEntity({
    required this.id,
    required this.bookingId,
    required this.showtimeId,
    required this.seatId,
    required this.price,
  });
}
