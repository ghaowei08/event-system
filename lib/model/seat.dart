// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
