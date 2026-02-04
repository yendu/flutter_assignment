import 'package:isar_community/isar.dart';

part 'bookmark_model.g.dart';

@collection
class BookmarkModel {
  Id id = Isar.autoIncrement;

  late int userId;
  late int postId;
  late String title;
  late String body;
  late String username;

}