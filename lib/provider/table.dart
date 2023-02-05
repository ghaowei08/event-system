import 'package:event_seating_2d/model/table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableNotifier extends StateNotifier<List<Table>> {
  TableNotifier()
      : super([
          Table(id: '1', seatIds: ['1', '2', '3'], name: 'Table 1'),
          Table(id: '2', seatIds: ['4', '5', '6'], name: 'Table 2')
        ]);

  create(Table table) {
    state.add(table);
  }

  update(Table table) {
    state = state.map((e) => e.id == table.id ? table : e).toList();
  }

  delete(String tableId) {
    state = state.where((e) => e.id != tableId).toList();
  }
}

final tablesProvider = StateNotifierProvider<TableNotifier, List<Table>>((ref) {
  return TableNotifier();
});
