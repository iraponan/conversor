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

  late double _real;
  late double _dollar;
  late double _euro;
  late double _libra;
  late double _pesoArg;
  late double _dollarCan;
  late double _dollarAust;
  late double _yenJap;
  late double _yuanChi;
  late double _bitcoin;

  void _resetFields() {
    String zero = UtilBrasilFields.obterReal(0, moeda: false, decimal: 2);
    realControler.text = zero;
    dollarControler.text = zero;
    euroControler.text = zero;
    libraControler.text = zero;
    pesoArgControler.text = zero;
    dollarCanControler.text = zero;
    dollarAustControler.text = zero;
    yenJapControler.text = zero;
    yuanChiControler.text = zero;
    bitcoinControler.text = zero;
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _real = 0;
    } else {
      _real = double.parse(text.replaceAll('.', '').replaceAll(',', '.'));
    }
    dollarControler.text =
        UtilBrasilFields.obterReal(_real / _dollar, moeda: false, decimal: 2);
    euroControler.text =
        UtilBrasilFields.obterReal(_real / _euro, moeda: false, decimal: 2);
    libraControler.text =
        UtilBrasilFields.obterReal(_real / _libra, moeda: false, decimal: 2);
    pesoArgControler.text =
        UtilBrasilFields.obterReal(_real / _pesoArg, moeda: false, decimal: 2);
    dollarCanControler.text = UtilBrasilFields.obterReal(_real / _dollarCan,
        moeda: false, decimal: 2);
    dollarAustControler.text = UtilBrasilFields.obterReal(_real / _dollarAust,
        moeda: false, decimal: 2);
    yenJapControler.text =
        UtilBrasilFields.obterReal(_real / _yenJap, moeda: false, decimal: 2);
    yuanChiControler.text =
        UtilBrasilFields.obterReal(_real / _yuanChi, moeda: false, decimal: 2);
    bitcoinControler.text =
        UtilBrasilFields.obterReal(_real / _bitcoin, moeda: false, decimal: 2);
  }

  void _dollarChanged(String text) {
    if (text.isEmpty) {
      _real = 0;
    } else {
      _real =
          double.parse(text.replaceAll('.', '').replaceAll(',', '.')) * _dollar;
    }
    realControler.text =
        UtilBrasilFields.obterReal(_real, moeda: false, decimal: 2);
    euroControler.text =
        UtilBrasilFields.obterReal(_real / _euro, moeda: false, decimal: 2);
    libraControler.text =
        UtilBrasilFields.obterReal(_real / _libra, moeda: false, decimal: 2);
    pesoArgControler.text =
        UtilBrasilFields.obterReal(_real / _pesoArg, moeda: false, decimal: 2);
    dollarCanControler.text = UtilBrasilFields.obterReal(_real / _dollarCan,
        moeda: false, decimal: 2);
    dollarAustControler.text = UtilBrasilFields.obterReal(_real / _dollarAust,
        moeda: false, decimal: 2);
    yenJapControler.text =
        UtilBrasilFields.obterReal(_real / _yenJap, moeda: false, decimal: 2);
    yuanChiControler.text =
        UtilBrasilFields.obterReal(_real / _yuanChi, moeda: false, decimal: 2);
    bitcoinControler.text =
        UtilBrasilFields.obterReal(_real / _bitcoin, moeda: false, decimal: 2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _real = 0;
    } else {
      _real =
          double.parse(text.replaceAll('.', '').replaceAll(',', '.')) * _euro;
    }
    dollarControler.text =
        UtilBrasilFields.obterReal(_real / _dollar, moeda: false, decimal: 2);
    realControler.text =
        UtilBrasilFields.obterReal(_real, moeda: false, decimal: 2);
    libraControler.text =
        UtilBrasilFields.obterReal(_real / _libra, moeda: false, decimal: 2);
    pesoArgControler.text =
        UtilBrasilFields.obterReal(_real / _pesoArg, moeda: false, decimal: 2);
    dollarCanControler.text = UtilBrasilFields.obterReal(_real / _dollarCan,
        moeda: false, decimal: 2);
    dollarAustControler.text = UtilBrasilFields.obterReal(_real / _dollarAust,
        moeda: false, decimal: 2);
    yenJapControler.text =
        UtilBrasilFields.obterReal(_real / _yenJap, moeda: false, decimal: 2);
    yuanChiControler.text =
        UtilBrasilFields.obterReal(_real / _yuanChi, moeda: false, decimal: 2);
    bitcoinControler.text =
        UtilBrasilFields.obterReal(_real / _bitcoin, moeda: false, decimal: 2);
  }

  void _libraChanged(String text) {
    if (text.isEmpty) {
      _real = 0;
    } else {
      _real =
          double.parse(text.replaceAll('.', '').replaceAll(',', '.')) * _libra;
    }
    dollarControler.text =
        UtilBrasilFields.obterReal(_real / _dollar, moeda: false, decimal: 2);
    euroControler.text =
        UtilBrasilFields.obterReal(_real / _euro, moeda: false, decimal: 2);
    realControler.text =
        UtilBrasilFields.obterReal(_real, moeda: false, decimal: 2);
    pesoArgControler.text =
        UtilBrasilFields.obterReal(_real / _pesoArg, moeda: false, decimal: 2);
    dollarCanControler.text = UtilBrasilFields.obterReal(_real / _dollarCan,
        moeda: false, decimal: 2);
    dollarAustControler.text = UtilBrasilFields.obterReal(_real / _dollarAust,
        moeda: false, decimal: 2);
    yenJapControler.text =
        UtilBrasilFields.obterReal(_real / _yenJap, moeda: false, decimal: 2);
    yuanChiControler.text =
        UtilBrasilFields.obterReal(_real / _yuanChi, moeda: false, decimal: 2);
    bitcoinControler.text =
        UtilBrasilFields.obterReal(_real / _bitcoin, moeda: false, decimal: 2);
  }

  void _pesoArgChanged(String text) {
    if (text.isEmpty) {
      _real = 0;
    } else {
      _real = double.parse(text.replaceAll('.', '').replaceAll(',', '.')) *
          _pesoArg;
    }
    dollarControler.text =
        UtilBrasilFields.obterReal(_real / _dollar, moeda: false, decimal: 2);
    euroControler.text =
        UtilBrasilFields.obterReal(_real / _euro, moeda: false, decimal: 2);
    libraControler.text =
        UtilBrasilFields.obterReal(_real / _libra, moeda: false, decimal: 2);
    realControler.text =
        UtilBrasilFields.obterReal(_real, moeda: false, decimal: 2);
    dollarCanControler.text = UtilBrasilFields.obterReal(_real / _dollarCan,
        moeda: false, decimal: 2);
    dollarAustControler.text = UtilBrasilFields.obterReal(_real / _dollarAust,
        moeda: false, decimal: 2);
    yenJapControler.text =
        UtilBrasilFields.obterReal(_real / _yenJap, moeda: false, decimal: 2);
    yuanChiControler.text =
        UtilBrasilFields.obterReal(_real / _yuanChi, moeda: false, decimal: 2);
    bitcoinControler.text =
        UtilBrasilFields.obterReal(_real / _bitcoin, moeda: false, decimal: 2);
  }

  void _dollarCanChanged(String text) {
    if (text.isEmpty) {
      _real = 0;
    } else {
      _real = double.parse(text.replaceAll('.', '').replaceAll(',', '.')) *
          _dollarCan;
    }
    dollarControler.text =
        UtilBrasilFields.obterReal(_real / _dollar, moeda: false, decimal: 2);
    euroControler.text =
        UtilBrasilFields.obterReal(_real / _euro, moeda: false, decimal: 2);
    libraControler.text =
        UtilBrasilFields.obterReal(_real / _libra, moeda: false, decimal: 2);
    pesoArgControler.text =
        UtilBrasilFields.obterReal(_real / _pesoArg, moeda: false, decimal: 2);
    realControler.text =
        UtilBrasilFields.obterReal(_real, moeda: false, decimal: 2);
    dollarAustControler.text = UtilBrasilFields.obterReal(_real / _dollarAust,
        moeda: false, decimal: 2);
    yenJapControler.text =
        UtilBrasilFields.obterReal(_real / _yenJap, moeda: false, decimal: 2);
    yuanChiControler.text =
        UtilBrasilFields.obterReal(_real / _yuanChi, moeda: false, decimal: 2);
    bitcoinControler.text =
        UtilBrasilFields.obterReal(_real / _bitcoin, moeda: false, decimal: 2);
  }

  void _dollarAustChanged(String text) {
    if (text.isEmpty) {
      _real = 0;
    } else {
      _real = double.parse(text.replaceAll('.', '').replaceAll(',', '.')) *
          _dollarAust;
    }
    dollarControler.text =
        UtilBrasilFields.obterReal(_real / _dollar, moeda: false, decimal: 2);
    euroControler.text =
        UtilBrasilFields.obterReal(_real / _euro, moeda: false, decimal: 2);
    libraControler.text =
        UtilBrasilFields.obterReal(_real / _libra, moeda: false, decimal: 2);
    pesoArgControler.text =
        UtilBrasilFields.obterReal(_real / _pesoArg, moeda: false, decimal: 2);
    dollarCanControler.text = UtilBrasilFields.obterReal(_real / _dollarCan,
        moeda: false, decimal: 2);
    realControler.text =
        UtilBrasilFields.obterReal(_real, moeda: false, decimal: 2);
    yenJapControler.text =
        UtilBrasilFields.obterReal(_real / _yenJap, moeda: false, decimal: 2);
    yuanChiControler.text =
        UtilBrasilFields.obterReal(_real / _yuanChi, moeda: false, decimal: 2);
    bitcoinControler.text =
        UtilBrasilFields.obterReal(_real / _bitcoin, moeda: false, decimal: 2);
  }

  void _yenJapChanged(String text) {
    if (text.isEmpty) {
      _real = 0;
    } else {
      _real =
          double.parse(text.replaceAll('.', '').replaceAll(',', '.')) * _yenJap;
    }
    dollarControler.text =
        UtilBrasilFields.obterReal(_real / _dollar, moeda: false, decimal: 2);
    euroControler.text =
        UtilBrasilFields.obterReal(_real / _euro, moeda: false, decimal: 2);
    libraControler.text =
        UtilBrasilFields.obterReal(_real / _libra, moeda: false, decimal: 2);
    pesoArgControler.text =
        UtilBrasilFields.obterReal(_real / _pesoArg, moeda: false, decimal: 2);
    dollarCanControler.text = UtilBrasilFields.obterReal(_real / _dollarCan,
        moeda: false, decimal: 2);
    dollarAustControler.text = UtilBrasilFields.obterReal(_real / _dollarAust,
        moeda: false, decimal: 2);
    realControler.text =
        UtilBrasilFields.obterReal(_real, moeda: false, decimal: 2);
    yuanChiControler.text =
        UtilBrasilFields.obterReal(_real / _yuanChi, moeda: false, decimal: 2);
    bitcoinControler.text =
        UtilBrasilFields.obterReal(_real / _bitcoin, moeda: false, decimal: 2);
  }

  void _yuanChiChanged(String text) {
    if (text.isEmpty) {
      _real = 0;
    } else {
      _real = double.parse(text.replaceAll('.', '').replaceAll(',', '.')) *
          _yuanChi;
    }
    dollarControler.text =
        UtilBrasilFields.obterReal(_real / _dollar, moeda: false, decimal: 2);
    euroControler.text =
        UtilBrasilFields.obterReal(_real / _euro, moeda: false, decimal: 2);
    libraControler.text =
        UtilBrasilFields.obterReal(_real / _libra, moeda: false, decimal: 2);
    pesoArgControler.text =
        UtilBrasilFields.obterReal(_real / _pesoArg, moeda: false, decimal: 2);
    dollarCanControler.text = UtilBrasilFields.obterReal(_real / _dollarCan,
        moeda: false, decimal: 2);
    dollarAustControler.text = UtilBrasilFields.obterReal(_real / _dollarAust,
        moeda: false, decimal: 2);
    yenJapControler.text =
        UtilBrasilFields.obterReal(_real / _yenJap, moeda: false, decimal: 2);
    realControler.text =
        UtilBrasilFields.obterReal(_real, moeda: false, decimal: 2);
    bitcoinControler.text =
        UtilBrasilFields.obterReal(_real / _bitcoin, moeda: false, decimal: 2);
  }

  void _bitcoinChanged(String text) {
    if (text.isEmpty) {
      _real = 0;
    } else {
      _real = double.parse(text.replaceAll('.', '').replaceAll(',', '.')) *
          _bitcoin;
    }
    dollarControler.text =
        UtilBrasilFields.obterReal(_real / _dollar, moeda: false, decimal: 2);
    euroControler.text =
        UtilBrasilFields.obterReal(_real / _euro, moeda: false, decimal: 2);
    libraControler.text =
        UtilBrasilFields.obterReal(_real / _libra, moeda: false, decimal: 2);
    pesoArgControler.text =
        UtilBrasilFields.obterReal(_real / _pesoArg, moeda: false, decimal: 2);
    dollarCanControler.text = UtilBrasilFields.obterReal(_real / _dollarCan,
        moeda: false, decimal: 2);
    dollarAustControler.text = UtilBrasilFields.obterReal(_real / _dollarAust,
        moeda: false, decimal: 2);
    yenJapControler.text =
        UtilBrasilFields.obterReal(_real / _yenJap, moeda: false, decimal: 2);
    yuanChiControler.text =
        UtilBrasilFields.obterReal(_real / _yuanChi, moeda: false, decimal: 2);
    realControler.text =
        UtilBrasilFields.obterReal(_real, moeda: false, decimal: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('\$ Conversor \$'),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _resetFields,
            icon: const Icon(Icons.refresh),
          )
        ],
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
                _dollar =
                    snapshot.data?['results']['currencies']['USD']['buy'] ?? 1;
                _euro =
                    snapshot.data?['results']['currencies']['EUR']['buy'] ?? 1;
                _libra =
                    snapshot.data?['results']['currencies']['GBP']['buy'] ?? 1;
                _pesoArg =
                    snapshot.data?['results']['currencies']['ARS']['buy'] ?? 1;
                _dollarCan =
                    snapshot.data?['results']['currencies']['CAD']['buy'] ?? 1;
                _dollarAust =
                    snapshot.data?['results']['currencies']['AUD']['buy'] ?? 1;
                _yenJap =
                    snapshot.data?['results']['currencies']['JPY']['buy'] ?? 1;
                _yuanChi =
                    snapshot.data?['results']['currencies']['CNY']['buy'] ?? 1;
                _bitcoin =
                    snapshot.data?['results']['currencies']['BTC']['buy'] ?? 1;
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
                        buildTextField(
                            'Real', 'R', realControler, _realChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField(
                            'Dólares', 'US', dollarControler, _dollarChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField(
                            'Euro', '€', euroControler, _euroChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField(
                            'Libra', '£', libraControler, _libraChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Peso Argentino', '', pesoArgControler,
                            _pesoArgChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Dólar Canadense', 'C',
                            dollarCanControler, _dollarCanChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Dólar Australiano', 'A',
                            dollarAustControler, _dollarAustChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Iene Japonês', '¥', yenJapControler,
                            _yenJapChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField('Yuan Chinês', '元', yuanChiControler,
                            _yuanChiChanged),
                        const SizedBox(
                          height: 8,
                        ),
                        buildTextField(
                            'Bitcoin', '₿', bitcoinControler, _bitcoinChanged),
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

Widget buildTextField(String label, String prefix,
    TextEditingController controller, Function(String) function) {
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
