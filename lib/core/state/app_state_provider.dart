import 'package:flutter_assignment/core/model/app_state_model.dart';
import 'package:flutter_assignment/core/model/bookmark_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/post_model.dart';
import '../repository/base_repository.dart';

part 'app_state_provider.g.dart';

@riverpod
class AppState extends _$AppState {
  // BaseRepository baseRepository = BaseRepository();
  @override
  AppStateModel build() {
    // baseRepository.fetchPosts();
    // BaseRepository.instance.fetchPosts();
    return AppStateModel(index: 0, isLoading: true, searchedText: '');
  }

  void updateIndex(int index) {
    state = state.copyWith(index: index);
  }

  void updateLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void setErrorMessage(String? message) {
    state = state.copyWith(errorMessage: message);
  }

  void setSearchedMessage(String text) {
    state = state.copyWith(searchedText: text);
  }

  Future<void> triggerPostFetch(WidgetRef ref) async {
    await BaseRepository.instance.fetchPosts(ref);
  }

  Future<List<PostModel>> getPosts(WidgetRef ref) async {
    return await BaseRepository.instance.getPosts();
  }

  Stream<List<BookmarkModel>> getBookmarks() async* {
    yield* BaseRepository.instance.getBookmarks();
  }

  Stream<List<PostModel>> getQueriedPosts(String title) async* {
    yield* BaseRepository.instance.getQueriedPosts(title);
  }

  Future<void> toggleBookmark(
    WidgetRef ref,
    int postId,
    bool isBookmarked,
    bool isBookmarkPage,
  ) async {
    await BaseRepository.instance.toggleBookmark(
      postId,
      isBookmarked,
      isBookmarkPage,
    );
  }
}
