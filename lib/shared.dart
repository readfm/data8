import 'package:drift/drift.dart';
import 'tables/events.dart';
part 'shared.g.dart';

class Keys extends Table {
  IntColumn get i => integer().autoIncrement()();
  TextColumn get private => text().unique()();
  TextColumn get public => text().unique()();
}

@DriftDatabase(tables: [Events, Keys])
class SharedDatabase extends _$SharedDatabase {
  SharedDatabase(QueryExecutor e) : super(e);
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        await customStatement('PRAGMA foreign_keys = OFF');

        if (from < 2) {
          await m.addColumn(events, events.file);
        }
      },
      beforeOpen: (details) async {
        if (details.wasCreated) {
        } else {
          //recreate
          if (false) {
            final m = Migrator(this);
            for (final table in allTables) {
              await m.deleteTable(table.actualTableName);
              await m.createTable(table);
            }
          }
        }
        await customStatement('PRAGMA foreign_keys = ON');
        // ....
      },
    );
  }
}
