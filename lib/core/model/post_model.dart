import 'package:isar_community/isar.dart';

part 'post_model.g.dart';

@collection
class PostModel {
  Id id = Isar.autoIncrement;

  late int userId;
  late int postId;
  late String title;
  late String body;
  late String username;

}