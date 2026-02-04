import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/model/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:isar_community/isar.dart';

import '../dependency_injection/dependency_injections.dart';
import '../model/bookmark_model.dart';
import '../state/app_state_provider.dart';

class BaseRepository {
  BaseRepository._privateConstructor();

  static final BaseRepository instance = BaseRepository._privateConstructor();

  Isar? _isarInstance;

  Future<Isar> _getIsar() async {
    _isarInstance ??= await locator.getAsync<Isar>();
    return _isarInstance!;
  }

  Future<void> deletePosts() async {
    final isar = await _getIsar();
    await isar.writeTxn(() async {
      await isar.postModels.clear();
    });
  }

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      headers: {'Accept': 'application/json'},
    ),
  );
  String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<void> fetchPosts(WidgetRef ref) async {
    try {
      ref.read(appStateProvider.notifier).updateLoading(true);
      ref.read(appStateProvider.notifier).setErrorMessage(null);

      final isar = await _getIsar();

      // Get existing bookmarks before deleting posts
      final existingPosts = await isar.postModels.where().findAll();
      final existingBookmarks = <int, bool>{};
      for (var existingPost in existingPosts) {
        existingBookmarks[existingPost.postId] =
            existingPost.isBookmarked ?? false;
      }

      await deletePosts();

      final postsRes = await dio.get('/posts');
      final usersRes = await dio.get('/users');

      if (postsRes.statusCode == 200 && usersRes.statusCode == 200) {
        Map<int, String> userMap = {};
        if (usersRes.data is List) {
          for (var user in usersRes.data) {
            userMap[user['id']] = user['name'] ?? 'Unknown';
          }
        }

        List<PostModel> postModels = [];
        for (var element in postsRes.data) {
          final userId = element['userId'] as int;
          final postId = element['id'] as int;
          postModels.add(
            PostModel()
              ..userId = userId
              ..postId = postId
              ..title = element['title'] ?? ''
              ..body = element['body'] ?? ''
              ..username = userMap[userId] ?? 'Unknown'
              ..isBookmarked = existingBookmarks[postId] ?? false,
          );
        }

        await isar.writeTxn(() async {
          await isar.postModels.putAll(postModels);
        });
      }
    } catch (e) {
      ref
          .read(appStateProvider.notifier)
          .setErrorMessage('Some error occurred: ${e.toString()}');
    } finally {
      ref.read(appStateProvider.notifier).updateLoading(false);
    }
  }

  Future<List<PostModel>> getPosts() async {
    try {
      final isar = await _getIsar();
      return await isar.postModels.where().findAll();
    } catch (e) {
      print(e);
      return [];
    }
  } Stream<List<BookmarkModel>> getBookmarks() async* {

      final isar = await _getIsar();
      yield*  isar.bookmarkModels.where().watch(fireImmediately: true);

  }

  Stream<List<PostModel>> getQueriedPosts() async* {
    final isar = await _getIsar();
    // Query<User> usersWithA = isar.users.filter()
    //     .nameStartsWith('A')
    //     .build();
    //
    // Stream<List<User>> queryChanged = usersWithA.watch(fireImmediately: true);
    // queryChanged.listen((users) {
    //   print('Users with A are: $users');
    // });
    yield* isar.postModels.where().watch(fireImmediately: true);
  }

  Future<void> toggleBookmark(int postId, bool isBookmarked,bool isBookmarkPage) async {
    try {
      final isar = await _getIsar();
      await isar.writeTxn(() async {
        final post = await isar.postModels
            .filter()
            .postIdEqualTo(postId)
            .findFirst();
        if(isBookmarkPage){
          await isar.bookmarkModels.filter().postIdEqualTo(postId).deleteAll();
          post?.isBookmarked = false;
          await isar.postModels.put(post!);
        }else{
          if (post != null) {
            post.isBookmarked = isBookmarked;
            await isar.postModels.put(post);
          }
          if (!isBookmarked) {
            await isar.bookmarkModels.filter().postIdEqualTo(postId).deleteAll();
          } else {
            await isar.bookmarkModels.put(
              BookmarkModel()
                ..username = post!.username
                ..body = post.body
                ..title = post.title
                ..postId = post.postId
                ..userId = post.userId,
            );
          }
        }


      });
    } catch (e) {
      print('Error toggling bookmark: $e');
    }
  }
}
