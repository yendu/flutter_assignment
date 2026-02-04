import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/ui/post.dart';
import 'package:flutter_assignment/homepage/ui/bookmarked_page.dart';

import '../../core/model/post_model.dart';
import '../../core/state/app_state_provider.dart';
import 'custom_bottom_navbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _hasTriggeredFetch = false;

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // TextField(decoration: InputDecoration(border: InputBorder),),
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
                              child: FutureBuilder<List<PostModel>>(
                                future: ref
                                    .read(appStateProvider.notifier)
                                    .getPosts(ref),
                                builder: (context, asyncSnapshot) {
                                  return ListView.builder(
                                    itemBuilder: (context, index) =>
                                        Post(post: asyncSnapshot.data![index]),
                                    itemCount: asyncSnapshot.data?.length ?? 0,
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
