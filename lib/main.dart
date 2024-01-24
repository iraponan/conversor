import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:convert/convert.dart';


final request = Uri.https('api.hgbrasil.com', '/finance/quotations', {'key' : '4691523c'});
    //'api.hgbrasil.com/finance/quotations?key=4691523c';

void main() async {
  http.Response response = await http.get(request);
  print(json.decode(response.body)['results']['currencies']);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(),
    ),
  );
}
