import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/ui/post.dart';
import 'package:flutter_assignment/homepage/ui/bookmarked_page.dart';

import '../../core/model/post_model.dart';
import '../../core/state/app_state_provider.dart';
import 'custom_bottom_navbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  bool _hasTriggeredFetch = false;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    textEditingController.removeListener(_onTextChanged);
    textEditingController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    ref
        .read(appStateProvider.notifier)
        .setSearchedMessage(textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        if (!_hasTriggeredFetch) {
          _hasTriggeredFetch = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(appStateProvider.notifier).triggerPostFetch(ref);
          });
        }
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomBottomNavbar(
            currentIndex: ref.watch(appStateProvider).index,
          ),
          appBar: AppBar(
            title: Text(
              ref.watch(appStateProvider).index == 0 ? 'Posts' : 'Bookmarks',
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: ref.watch(appStateProvider).index == 0
                ? Column(
                    mainAxisAlignment: ref.watch(appStateProvider).isLoading
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Search posts by title',
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon:
                                ref
                                    .watch(appStateProvider)
                                    .searchedText
                                    .isNotEmpty
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      textEditingController.clear();
                                    },
                                  )
                                : null,
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                      ref.watch(appStateProvider).isLoading == true
                          ? Center(child: CircularProgressIndicator())
                          : ref.watch(appStateProvider).errorMessage != null
                          ? Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ref.read(appStateProvider).errorMessage!,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(width: 10),
                                  IconButton(
                                    onPressed: () => ref
                                        .read(appStateProvider.notifier)
                                        .triggerPostFetch(ref),
                                    icon: Icon(Icons.refresh_rounded, size: 24),
                                  ),
                                ],
                              ),
                            )
                          : Expanded(
                              child: StreamBuilder<List<PostModel>>(
                                stream: ref
                                    .read(appStateProvider.notifier)
                                    .getQueriedPosts(
                                      ref.watch(appStateProvider).searchedText,
                                    ),
                                builder: (context, asyncSnapshot) {
                                  if (asyncSnapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  if (asyncSnapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        'Error: ${asyncSnapshot.error}',
                                      ),
                                    );
                                  }
                                  final posts = asyncSnapshot.data ?? [];
                                  if (posts.isEmpty &&
                                      ref
                                          .watch(appStateProvider)
                                          .searchedText
                                          .isNotEmpty) {
                                    return const Center(
                                      child: Text('No posts found'),
                                    );
                                  }
                                  if (posts.isEmpty) {
                                    return const Center(
                                      child: Text('No posts available'),
                                    );
                                  }
                                  return ListView.builder(
                                    itemBuilder: (context, index) =>
                                        Post(post: posts[index]),
                                    itemCount: posts.length,
                                  );
                                },
                              ),
                            ),
                    ],
                  )
                : BookmarkedPage(),
          ),
        );
      },
    );
  }
}
