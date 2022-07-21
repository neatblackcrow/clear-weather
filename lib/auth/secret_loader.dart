import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadSecret() => rootBundle.loadStructuredData<String>(
    'lib/auth/secret.json',
    (jsonStr) async => await jsonDecode(jsonStr)['appId']);
