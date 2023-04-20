import 'dart:io';
import 'package:sqlite3/open.dart';
import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'data.dart';
import 'shared.dart';
import 'package:path/path.dart';

SharedDatabase constructDb() {
  if (Platform.isWindows) open.overrideFor(OperatingSystem.windows, _openOnWin);

  final db = LazyDatabase(() async {
    final file = File(join(FData.path, 'db.sqlite'));

    return NativeDatabase(file);
  });
  return SharedDatabase(db);
}

DynamicLibrary _openOnWin() {
  final script = File(Platform.script.toFilePath());
  final libraryNextToScript = File('./sqlite3.dll');
  return DynamicLibrary.open(libraryNextToScript.path);
}
