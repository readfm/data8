import 'package:drift/drift.dart';
import 'package:riverpod/riverpod.dart';

import '../index.dart';
import '../tables/events.dart';

/// An object that controls a list of [Todo].
class EventsList extends StateNotifier<List<Event>> {
  EventsList([List<Event>? initialTodos]) : super(initialTodos ?? []);

  /*
  void add(String description) {
    state = [
      ...state,
      Event(
        id: _uuid.v4(),
        description: description,
      ),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: !todo.completed,
            description: todo.description,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Event(
            id: todo.id,
            completed: todo.completed,
            description: description,
          )
        else
          todo,
    ];
  }
  */

  Stream<List<Event>>? watcher;
  load() {
    final select = db.select(db.events);
    //select.where((tbl) => tbl.syncAt.equals(0));
    select.orderBy(
      [
        (tbl) => OrderingTerm(
              expression: tbl.createdAt,
              mode: OrderingMode.desc,
            )
      ],
    );
    watcher = select.watch()
      ..listen((list) {
        state = list;
      });
    /*
    (rows) {
      rows.forEach((row) {
        final m = row.toJson();
        m.remove('syncAt');
        m.remove('i');
        m['created_at'] = m['createdAt'];
        m['tags'] = [];
        m.remove('createdAt');
        //relay.send(m);
      });

      if (rows.isNotEmpty) Events.synched();
    };
    */
  }

  void remove(Event target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}
