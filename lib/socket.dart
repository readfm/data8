import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:drift/drift.dart';

import 'index.dart';
import 'main.dart';
import 'session.dart';

class FSocket {
  /*
  Map<String, Fractal> subscribed = {};
  subscribe(Fractal fractal) {
    subscribed[fractal.id] = fractal;
  }
  */

  FSocket();

  bool active = true;

  readFrac(b, f) {}

  SessionF? _session;

  set session(SessionF? session) {
    if (session == null) {
      _session = null;
      return;
    }

    _session = session;
  }

  SessionF? get session => _session;

  final elements = StreamController<Map>.broadcast();
  Stream<dynamic> get stream => elements.stream;
  sink(m) {
    elements.sink.add(m);
  }

  final ht = 34355;

  readPath(List<int> b) => utf8.decode(b.sublist(2, b[1] + 2));

  respond() {}

  handle(Map<String, dynamic> m) async {
    if (m['search'] is String) {
      final select = db.select(db.events)
        ..orderBy([
          (t) => OrderingTerm(
                expression: t.createdAt,
                mode: OrderingMode.desc,
              ),
        ])
        ..limit(100);

      final search = m['search'] ?? '';
      if (search.isNotEmpty) {
        select.where((t) => t.content.like('%$search%'));
      }
      if (m['after'] is int) {
        select.where((t) => t.createdAt.isSmallerThanValue(m['after']));
      }
      if (m['before'] is int) {
        select.where((t) => t.createdAt.isBiggerThanValue(m['before']));
      }
      final r = await select.get();

      final list = r.map((e) => e.toJson()).toList();

      final re = <String, dynamic>{};
      re['list'] = list;
      re['cb'] = m['cb'];
      sink(re);
      return;
    }

    if (m['cmd'] == 'post') {
      final item = Event.fromJson(m['item']);

      final id = await db.into(db.events).insert(item);

      final re = <String, dynamic>{
        'id': id,
        'cb': m['cb'],
      };
      sink(re);
      return;

      return;
    }
  }

  receive(d) async {
    if (d is String && d.startsWith('{') && d.endsWith('}')) {
      final m = jsonDecode(d);
      handle(m);
    }
    final b = d as Uint8List;

    final v = ByteData.view(b.buffer, 0, 2);
    final type = v.getUint16(0);

    print('type: $type');
    /*

    if (word != null) {
      Fractal fractal;
      if (b[2] > 0) {
        final idLastB = b[2] + 3;
        final idBs = b.sublist(3, idLastB);
        final id = utf8.decode(idBs);
        print('handle: $id of ${word.name}');
        fractal = word.take(id);
        if (b.length > idLastB) fractal.bytes = b.sublist(idLastB);
      } else {
        print('handle new ${word.name}');
        final builder = FractalExtWord.map[word];
        if (builder == null) return;
        fractal = builder();
        if (b.length > 3) fractal.bytes = b.sublist(3);
      }

      // TODO better handle session
      if (fractal is FractalSocketAbs) {
        final r = (fractal as FractalSocketAbs).handle(this);
        /*
        if (r != null) {
          // TODO send back null if not found
          socket.sink((await r).bytes);
        }
        */
      }

      final reId = fractal.fm[Word('re')];
      if (reId != null) {
        final re = GetFractal.map[reId.value]?.re;
        if (re != null) re(fractal);
      }
    }
    */
    return null;
  }

  static final _onConnectedCBs = <Function(FSocket socket)>[];
  static onConnected(Function(FSocket socket) cb) {
    _onConnectedCBs.add(cb);
  }

  /*
  ready(FServer server) {
    sink(server);
    for (final cb in _onConnectedCBs) {
      cb(this);
    }
  }
  */
}
