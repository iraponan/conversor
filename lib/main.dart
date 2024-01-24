import 'dart:convert';

import 'package:conversor/pages/home.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:convert/convert.dart';

const String key = String.fromEnvironment('KEYHGBRASIL');
final request = Uri.https('api.hgbrasil.com', '/finance/quotations', {'key' : key});

void main() async {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}
