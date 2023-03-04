import 'dart:typed_data';

import 'package:intl/intl.dart';

import 'shared.dart';

class FData {
  static var path = '../';
  static const isSecure = true;
  static const host = 'oo.io.cx';

  static final cache = <String, Uint8List>{};

  static String get getHttp => "http${isSecure ? 's' : ''}://$host";

  static final dateFormat = DateFormat('MM-dd-yyyy kk:mm');
}
