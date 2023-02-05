// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:event_seating_2d/provider/seat.dart';

class SeatComponent extends ConsumerWidget {
  final String seatId;
  final double dx;
  final double dy;

  const SeatComponent({
    super.key,
    required this.seatId,
    this.dx = 100,
    this.dy = 100,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seat = ref.watch(seatsProvider).firstWhere((e) => e.id == seatId);
    return Positioned(
      left: dx,
      top: dy,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(),
        ),
        child: Center(child: Text(seat.id)),
      ),
    );
  }
}
