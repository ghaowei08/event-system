import 'package:event_seating_2d/components/seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:event_seating_2d/provider/table.dart';

class TableComponent extends ConsumerWidget {
  final String tableId;

  const TableComponent({
    super.key,
    required this.tableId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final table = ref.watch(tablesProvider).firstWhere((e) => e.id == tableId);
    final double diameter = table.radius * 2;
    return Stack(
      children: [
        Center(
          child: Container(
            width: diameter,
            height: diameter,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(),
            ),
            child: Center(child: Text(table.name)),
          ),
        ),
        SeatComponent(seatId: '1')
      ],
    );
  }
}
