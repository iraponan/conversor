import 'dart:convert';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final TextEditingController realControler = TextEditingController();
  final TextEditingController dollarControler = TextEditingController();
  final TextEditingController euroControler = TextEditingController();
  final TextEditingController libraControler = TextEditingController();
  final TextEditingController pesoArgControler = TextEditingController();
  final TextEditingController dollarCanControler = TextEditingController();
  final TextEditingController dollarAustControler = TextEditingController();
  final TextEditingController yenJapControler = TextEditingController();
  final TextEditingController yuanChiControler = TextEditingController();
  final TextEditingController bitcoinControler = TextEditingController();

  double? dollar;
  double? euro;
  double? libra;
  double? pesoArg;
  double? dollarCan;
  double? dollarAust;
  double? yenJap;
  double? yuanChi;
  double? bitcoin;

  void _realChanged(String text) {
    print(text);
  }

  void _dollarChanged(String text) {
    print(text);
  }

  void _euroChanged(String text) {
    print(text);
  }

  void _libraChanged(String text) {
    print(text);
  }

  void _pesoArgChanged(String text) {
    print(text);
  }

  void _dollarCanChanged(String text) {
    print(text);
  }

  void _dollarAustChanged(String text) {
    print(text);
  }

  void _yenJapChanged(String text) {
    print(text);
  }

  void _yuanChiChanged(String text) {
    print(text);
  }

  void _bitcoinChanged(String text) {
    print(text);
  }

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
                dollar = snapshot.data?['results']['currencies']['USD']['buy'] ?? 0;
                euro = snapshot.data?['results']['currencies']['EUR']['buy'] ?? 0;
                libra = snapshot.data?['results']['currencies']['GBP']['buy'] ?? 0;
                pesoArg = snapshot.data?['results']['currencies']['ARS']['buy'] ?? 0;
                dollarCan = snapshot.data?['results']['currencies']['CAD']['buy'] ?? 0;
                dollarAust = snapshot.data?['results']['currencies']['AUD']['buy'] ?? 0;
                yenJap = snapshot.data?['results']['currencies']['JPY']['buy'] ?? 0;
                yuanChi = snapshot.data?['results']['currencies']['CNY']['buy'] ?? 0;
                bitcoin = snapshot.data?['results']['currencies']['BTC']['buy'] ?? 0;
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          size: 150,
                          color: Colors.amber,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Real', 'R', realControler, _realChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Dólares', 'US', dollarControler, _dollarChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Euro', '€', euroControler, _euroChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Libra', '£', libraControler, _libraChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Peso Argentino', '', pesoArgControler, _pesoArgChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Dólar Canadense', 'C', dollarCanControler, _dollarCanChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Dólar Australiano', 'A', dollarAustControler, _dollarAustChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Iene Japonês', '¥', yenJapControler, _yenJapChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Yuan Chinês', '元', yuanChiControler, _yuanChiChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Bitcoin', '₿', bitcoinControler, _bitcoinChanged),
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

Widget buildTextField(String label, String prefix, TextEditingController controller, Function(String) function) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.amber,
      ),
      border: const OutlineInputBorder(),
      prefixText: '$prefix\$ ',
    ),
    style: const TextStyle(
      color: Colors.amber,
      fontSize: 25,
    ),
    keyboardType: TextInputType.number,
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      CentavosInputFormatter(moeda: false, casasDecimais: 2),
    ],
    onChanged: function,
  );
}
