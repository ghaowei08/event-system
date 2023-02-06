import 'package:event_seating_2d/provider/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigatorScreen extends ConsumerWidget {
  const NavigatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final double navigatorWidth = ref.watch(navigatorWidthProvider);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: navigatorWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    right: BorderSide(color: Theme.of(context).dividerColor),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    ...ref.watch(navigatorButtonsProvider)
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ref.watch(navigatorTargetProvider),
                ),
              )
            ],
          ),
          Positioned(
            left: navigatorWidth - 25,
            top: 15,
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: IconButton(
                  onPressed: () {
                    ref.read(isExpandedProvider.notifier).state =
                        !ref.read(isExpandedProvider.notifier).state;
                  },
                  icon: Icon(
                    ref.watch(expandedIconProvider),
                    size: 25,
                    color: Colors.blue.withOpacity(0.6),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
