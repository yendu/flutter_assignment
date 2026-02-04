import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_assignment/core/model/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:isar_community/isar.dart';

import '../dependency_injection/dependency_injections.dart';
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
      await deletePosts();

      final res = await dio.get('/posts');

      if (res.statusCode == 200) {
        List<PostModel> postModels = [];
        res.data.forEach((element) async {
          String? username = await fetchUser(element['userId']);
          postModels.add(
            PostModel()
              ..userId = element['userId']
              ..postId = element['id']
              ..title = element['title']
              ..body = element['body']
              ..username = 'username' ?? 'Unknown',
          );
        });
        final isar = await _getIsar();
        await isar.writeTxn(() async {
          await isar.postModels.putAll(postModels);
        });
      }
    } catch (e) {
      ref
          .read(appStateProvider.notifier)
          .setErrorMessage('Some error occurred');
    } finally {
      ref.read(appStateProvider.notifier).updateLoading(false);
    }
  }

  Future<String?> fetchUser(int userId) async {
    final res = await dio.get('/users/$userId');

    if (res.statusCode == 200) {
      return res.data['name'];
    }
    return null;
  }

  Future<List<PostModel>> getPosts() async {
    try {
      final isar = await _getIsar();
      return await isar.postModels.where().findAll();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
