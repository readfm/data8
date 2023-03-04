import 'package:drift/drift.dart';

import '../main.dart';
import '../shared.dart';

class Events extends Table {
  //IntColumn get i => integer().autoIncrement()();
  TextColumn get id => text().unique()();
  TextColumn get pubkey => text()();
  IntColumn get createdAt => integer()();
  IntColumn get syncAt => integer()();
  IntColumn get kind => integer()();
  //TextColumn get tags => text()();
  TextColumn get content => text()();
  TextColumn get file => text().withDefault(Constant(''))();
  TextColumn get sig => text()();

  static final map = <String, Event?>{};
  /*
  static Future<int> save(Map<String, dynamic> m) async =>
      await db.into(db.events).insert(
            make(m),
          );


  static EventsCompanion make(Map<String, dynamic> m) => EventsCompanion.insert(
        id: m['id'],
        createdAt: m['created_at'],
        kind: m['kind'],
        //tags: m['tags'],
        syncAt: m['syncAt'],
        content: m['content'],
        pubkey: m['pubkey'],
        file: m['file'],
        sig: m['sig'],
      );

  static var lastSyncAt = 0;
  static Future<int> lastSync() async {
    //highest last sync
    final r = await (db.select(db.events)
          ..orderBy([
            (t) => OrderingTerm(
                  expression: t.syncAt,
                  mode: OrderingMode.desc,
                )
          ])
          ..limit(1))
        .getSingleOrNull();
    lastSyncAt = r?.syncAt ?? 0;
    return lastSyncAt;
  }

  */
  //update to synched
  static Future<int> synched() async {
    final now = DateTime.now(), nowSeconds = now.millisecondsSinceEpoch ~/ 1000;
    final r = await (db.update(db.events)..where((tbl) => tbl.syncAt.equals(0)))
        .write(EventsCompanion(syncAt: Value(nowSeconds)));
    return r;
  }

  static Future<int> store(Map<String, dynamic> m) async {
    final r = await (db.select(db.events)
          ..where((tbl) => tbl.id.equals(m['id'])))
        .get();

    if (r.isEmpty) return 0;

    final now = DateTime.now();
    m['syncAt'] = now.millisecondsSinceEpoch ~/ 1000;

    return save(m);
  }
}
