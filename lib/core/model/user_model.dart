import 'package:isar_community/isar.dart';

part 'user_model.g.dart';

@collection
class UserModel {
  Id id = Isar.autoIncrement;

  late int userId;
  late String username;
  late String email;
  late String password;
  late String phone;
  late String website;

}