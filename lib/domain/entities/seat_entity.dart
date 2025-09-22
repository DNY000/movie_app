class SeatEntity {
  final String id;
  final String roomId;
  final String seatRow;
  final int seatNumber;
  final int? seatTypeId;

  SeatEntity({
    required this.id,
    required this.roomId,
    required this.seatRow,
    required this.seatNumber,
    this.seatTypeId,
  });
}
