import 'package:flutter/material.dart';
import 'package:bytebank/models/controllers/Transferencias.dart';

class FormularioTranseferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTranseferencia> {
  final TextEditingController _destino_pagamento = TextEditingController();
  final TextEditingController _valor_pagamento = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _destino_pagamento,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "Destino",
                  hintText: "Destino do pagamento",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _valor_pagamento,
                decoration: const InputDecoration(
                    hintText: "00.0",
                    labelText: "Valor",
                    icon: Icon(Icons.monetization_on)),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  final double? valor = double.tryParse(_valor_pagamento.text);
                  final String destino = _destino_pagamento.text;

                  if (valor != null) {
                    _criaTransferencia(context);
                  }
                },
                child: const Text("Registrar"),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Registrar Novo Pagamento"),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final String numeroConta = _destino_pagamento.text;
    final double? valor = double.tryParse(_valor_pagamento.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
