import 'dart:async';

import 'package:drift/drift.dart';

import 'index.dart';
import 'shared.dart';

class FreaksSystem {
  var list = <Event>[];
  StreamSubscription<List<Event>>? _listener;
  var search = '';
  filter([String search = '']) {
    this.search = search;
    _listener?.cancel();
    final select = db.select(db.events)
      ..orderBy([
        (t) => OrderingTerm(
              expression: t.createdAt,
              mode: OrderingMode.desc,
            ),
      ])
      ..limit(100);
    if (search.isNotEmpty) {
      select.where((t) => t.content.like('%$search%'));
    }
    _listener = select.watch().listen((events) {});
  }
}
