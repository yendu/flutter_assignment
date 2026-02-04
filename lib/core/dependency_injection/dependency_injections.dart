import 'package:flutter_assignment/core/model/post_model.dart';
import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/bookmark_model.dart';

final locator = GetIt.instance;

Future<void> setupDependencyInjection() async {
  locator.registerSingletonAsync<Isar>(() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      Isar isar = await Isar.open([
        PostModelSchema,
        BookmarkModelSchema,

      ], directory: dir.path);

      return isar;
    }

    return Future.value(Isar.getInstance());
  });
  
  // Ensure Isar is fully initialized before proceeding
  await locator.getAsync<Isar>();
}
