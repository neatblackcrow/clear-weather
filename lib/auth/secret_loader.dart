import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class SecretLoader {
  static Future<String> load() => rootBundle.loadStructuredData<String>(
      'lib/auth/secret.json',
      (jsonStr) async => await jsonDecode(jsonStr)['appId']);
}
