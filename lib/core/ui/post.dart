import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/model/bookmark_model.dart';
import 'package:flutter_assignment/core/model/post_model.dart';
import 'package:flutter_assignment/core/state/app_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Post extends ConsumerWidget {
  final PostModel? post;
  final BookmarkModel? bookmark;

  const Post({super.key, this.post, this.bookmark});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      post?.title ?? bookmark!.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final newBookmarkStatus = !(post?.isBookmarked ?? false);
                      await ref
                          .read(appStateProvider.notifier)
                          .toggleBookmark(
                            ref,
                            post?.postId ?? bookmark!.postId,
                            newBookmarkStatus,bookmark!=null
                          );
                    },
                    icon: post?.isBookmarked == true || bookmark != null
                        ? const Icon(Icons.bookmark, color: Colors.green)
                        : const Icon(Icons.bookmark_border),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                post?.body ?? bookmark!.body,
                style: const TextStyle(fontSize: 16),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text(
                post?.username ?? bookmark!.username,
                style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
