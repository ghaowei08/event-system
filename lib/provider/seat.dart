import 'package:event_seating_2d/model/seat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeatNotifier extends StateNotifier<List<Seat>> {
  SeatNotifier()
      : super([
          Seat(id: '1', guestName: null, seq: 1),
          Seat(id: '2', guestName: null, seq: 2),
          Seat(id: '3', guestName: null, seq: 3),
          Seat(id: '4', guestName: null, seq: 4),
          Seat(id: '5', guestName: null, seq: 5),
          Seat(id: '6', guestName: null, seq: 6),
        ]);

  addTable(Seat seat) {
    state.add(seat);
  }

  editTable(Seat seat) {
    state = state.map((e) => e.id == seat.id ? seat : e).toList();
  }

  removeTable(String seatId) {
    state = state.where((e) => e.id != seatId).toList();
  }
}

final seatsProvider = StateNotifierProvider<SeatNotifier, List<Seat>>((ref) {
  return SeatNotifier();
});
