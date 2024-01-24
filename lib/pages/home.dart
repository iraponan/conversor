import 'dart:convert';

import 'package:conversor/main.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:convert/convert.dart';

const String key = String.fromEnvironment('KEYHGBRASIL');
final request =
    Uri.https('api.hgbrasil.com', '/finance/quotations', {'key': key});

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('\$ Conversor \$'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: Text(
                  'Carregando Dados...',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Erro ao Carregar os Dados!!! :(',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                return Container(
                  color: Colors.green,
                );
              }
          }
        },
        future: getData(),
      ),
    );
  }
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}
