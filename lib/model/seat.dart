class Seat {
  String id;
  int seatNumber;
  int seq;
  String? guestName;

  Seat({
    required this.id,
    required this.seq,
    this.seatNumber = 10,
    this.guestName,
  });
}
