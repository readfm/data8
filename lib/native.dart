import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'data.dart';
import 'shared.dart';
import 'package:path/path.dart';

SharedDatabase constructDb() {
  final db = LazyDatabase(() async {
    final file = File(join(FData.path, 'db.sqlite'));

    return NativeDatabase(file);
  });
  return SharedDatabase(db);
}
