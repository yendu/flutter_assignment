import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/ui/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/state/app_state_provider.dart';

class BookmarkedPage extends StatelessWidget {
  const BookmarkedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,child) {
        return StreamBuilder(
            stream: ref.read(appStateProvider.notifier).getBookmarks(),
            builder: (context, asyncSnapshot) {
              // if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              //   return Center(child: CircularProgressIndicator());
              // }
              final bookmarks = asyncSnapshot.data ?? [];
              return ListView.builder(
                itemBuilder: (context, index) => Post(
                  bookmark: bookmarks[index],
                ),
                itemCount: bookmarks.length,
              );
            }
        );
      }
    );
  }
}
