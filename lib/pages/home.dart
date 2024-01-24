import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
                double dollar =
                    snapshot.data?['results']['currencies']['USD']['buy'] ?? 0;
                double euro =
                    snapshot.data?['results']['currencies']['EUR']['buy'] ?? 0;
                double libra =
                    snapshot.data?['results']['currencies']['GBP']['buy'] ?? 0;
                double pesoArg =
                    snapshot.data?['results']['currencies']['ARS']['buy'] ?? 0;
                double dollarCan =
                    snapshot.data?['results']['currencies']['CAD']['buy'] ?? 0;
                double dollarAust =
                    snapshot.data?['results']['currencies']['AUD']['buy'] ?? 0;
                double yenJap =
                    snapshot.data?['results']['currencies']['JPY']['buy'] ?? 0;
                double yuanChi =
                    snapshot.data?['results']['currencies']['CNY']['buy'] ?? 0;
                double bitcoin =
                    snapshot.data?['results']['currencies']['BTC']['buy'] ?? 0;
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          size: 150,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Reais',
                            labelStyle: TextStyle(
                              color: Colors.amber,
                            ),
                            border: OutlineInputBorder(),
                            prefixText: 'R\$',
                          ),
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Dólares',
                            labelStyle: TextStyle(
                              color: Colors.amber,
                            ),
                            border: OutlineInputBorder(),
                            prefixText: 'US\$',
                          ),
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Euro',
                            labelStyle: TextStyle(
                              color: Colors.amber,
                            ),
                            border: OutlineInputBorder(),
                            prefixText: '€\$',
                          ),
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
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
