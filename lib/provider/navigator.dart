// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:event_seating_2d/screens/event.dart';
import 'package:event_seating_2d/screens/home.dart';
import 'package:event_seating_2d/screens/visitor.dart';
import 'package:event_seating_2d/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isExpandedProvider = StateProvider<bool>((ref) => true);

final expandedIconProvider = StateProvider<IconData>((ref) =>
    ref.watch(isExpandedProvider) ? Icons.arrow_back : Icons.arrow_forward);

class NavBtn {
  IconData icon;
  void Function() onTap;
  String label;
  NavBtn({
    required this.icon,
    required this.onTap,
    required this.label,
  });
}

final navigatorWidthProvider =
    Provider<double>((ref) => ref.watch(isExpandedProvider) ? 150 : 75);

final navigatorButtonsProvider = StateProvider<List<Widget>>((ref) {
  final isExpanded = ref.watch(isExpandedProvider);

  final initial = [
    NavBtn(
        icon: Icons.dashboard_rounded,
        onTap: () => ref.read(routeProvider.notifier).state = 1,
        label: 'Home'),
    NavBtn(
        icon: Icons.people_alt_rounded,
        onTap: () => ref.read(routeProvider.notifier).state = 2,
        label: 'Visitor'),
    NavBtn(
        icon: Icons.list_alt_rounded,
        onTap: () => ref.read(routeProvider.notifier).state = 3,
        label: 'Event'),
    NavBtn(
        icon: Icons.access_alarm,
        onTap: () => ref.read(routeProvider.notifier).state = 4,
        label: '3'),
  ];

  return initial.map((e) {
    final icon = Icon(
      e.icon,
      size: IconConfig().iconSize,
      color: Colors.blue.withOpacity(0.6),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: e.onTap,
          child: SizedBox(
            height: 50,
            child: isExpanded
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      icon,
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        e.label,
                        style: TextConfig().navigatorLabelStyle,
                      )
                    ],
                  )
                : icon,
          ),
        ),
      ),
    );
  }).toList();
});

final routeProvider = StateProvider<int>((ref) => 1);

final navigatorTargetProvider = Provider<Widget>((ref) {
  final target = ref.watch(routeProvider);

  switch (target) {
    case 1:
      return const HomeScreen();
    case 2:
      return const VisitorScreen();
    case 3:
      return const FloorScreen();
    default:
      return const HomeScreen();
  }
});
