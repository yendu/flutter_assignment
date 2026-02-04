import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/state/app_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavbar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    enableFeedback: false,
                    onPressed: () =>
                        ref.read(appStateProvider.notifier).updateIndex(0),
                    icon: currentIndex == 0
                        ? const Icon(Icons.home, size: 32, color: Colors.green)
                        : const Icon(
                            Icons.home_outlined,
                            size: 32,
                            color: Colors.black,
                          ),
                  ),
                  IconButton(
                    enableFeedback: false,
                    onPressed: () async {
                      ref.read(appStateProvider.notifier).updateIndex(1);
                    },
                    icon: currentIndex == 1
                        ? const Icon(
                            Icons.bookmark_rounded,
                            size: 32,
                            color: Colors.green,
                          )
                        : const Icon(Icons.bookmark_outline_rounded, size: 32),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
