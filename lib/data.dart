import 'dart:typed_data';

import 'package:intl/intl.dart';

class FData {
  static var path = '../';
  static const isSecure = true;
  static String get host => isSecure ? 'find.io.cx' : 'localhost:8800';

  static final cache = <String, Uint8List>{};

  static String get getHttp => "http${isSecure ? 's' : ''}://$host";

  static final dateFormat = DateFormat('MM-dd-yyyy kk:mm');
  static eat(Map<String, dynamic> m) {}
}
