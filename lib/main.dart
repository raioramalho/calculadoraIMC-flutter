import 'package:flutter/material.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    title: 'Caluladora de IMC',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controladorDePeso = TextEditingController();
  TextEditingController controladorDeAltura = TextEditingController();

  void _resetFields() {
    controladorDePeso.text = "";
    controladorDeAltura.text = "";
  }

  String _infoText = "Informe seus dados: ";

  void _calculate() {
    setState(() {
      double peso = double.parse(controladorDePeso.text);
      double altura = double.parse(controladorDeAltura.text) / 100;

      double imc = peso / (altura * altura);
      print(imc);

      if (imc < 18.6) {
        _infoText = "Abaixo do Peso: (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal: (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau 1: (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9) {
        _infoText = "Obesidade Grau 2 e 3: (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Caluladora de IMC'),
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                _resetFields();
                print('Teste');
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outlined,
                size: 120.0,
                color: Colors.deepPurple,
              ),
              TextField(
                controller: controladorDePeso,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Colors.deepPurple)),
                    labelText: 'Peso em [Kg]',
                    labelStyle: TextStyle(color: Colors.deepPurple)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
              Divider(),
              TextField(
                controller: controladorDeAltura,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Colors.deepPurple)),
                    labelText: 'Altura em [Cm]',
                    labelStyle: TextStyle(color: Colors.deepPurple)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
              Divider(),
              Text(
                _infoText,
                textAlign: TextAlign.center,
              ),
              Divider(),
              IconButton(
                icon: Icon(
                  Icons.calculate,
                  size: 50.0,
                  color: Colors.deepPurple,
                ),
                onPressed: _calculate,
              ),
            ],
          ),
        ));
  }
}
