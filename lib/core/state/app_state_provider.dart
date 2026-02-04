import 'package:flutter_assignment/core/model/app_state_model.dart';
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
    return AppStateModel(index: 0, isLoading: true);
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

  Future<void> triggerPostFetch(WidgetRef ref) async {
    await BaseRepository.instance.fetchPosts(ref);
  }
  Future<List<PostModel>> getPosts(WidgetRef ref) async {
    return await BaseRepository.instance.getPosts();
  }
}
