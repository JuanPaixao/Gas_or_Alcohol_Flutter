import 'package:flutter/material.dart';

class FieldText extends StatefulWidget {
  @override
  _FieldTextState createState() => _FieldTextState();
}

class _FieldTextState extends State<FieldText> {
  TextEditingController _controllerAlcohol = TextEditingController();
  TextEditingController _controllerGas = TextEditingController();
  String _textResult = "";

  void _calculate() {
    double precoAlcool = double.tryParse(_controllerAlcohol.text);
    double precoGas = double.tryParse(_controllerGas.text);

    setState(() {
      _textResult = "";
    });

    if (precoGas == null || precoAlcool == null) {
      setState(() {
        _textResult = "Valor inválido";
      });
    } else {
      setState(() {
        if (precoAlcool / precoGas >= 0.7) {
          _textResult = "Melhor abatecer com gasolina!";
        } else {
          _textResult = "Melhor abatecer com álcool";
        }
      });
    }
    _cleanFields();
  }

  void _cleanFields() {
    _controllerAlcohol.text = ""; //no controlador nao precisa do setState para atualizar
    _controllerGas.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue, title: Text("Entrada de dados")),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Preço Alcool, ex 3.59",
                      ),
                      maxLength: 4,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                      /* onChanged: (String e) {
                    print("valor " + e);
                  }
                  ,*/
                      onSubmitted: (String e) {},
                      controller:
                          _controllerAlcohol, //controla campo de texto definido
                    )),
                Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Preço Gasolina, ex 4.55",
                      ),
                      maxLength: 4,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                      /* onChanged: (String e) {
                    print("valor " + e);
                  }
                  ,*/
                      onSubmitted: (String e) {},
                      controller:
                          _controllerGas, //controla campo de texto definido
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                        "Salvar",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue,
                      onPressed: () => _calculate()),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      _textResult,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
