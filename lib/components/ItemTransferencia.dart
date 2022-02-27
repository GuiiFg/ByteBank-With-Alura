import 'package:flutter/material.dart';
import 'package:bytebank/models/controllers/Transferencias.dart';

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text("BRL " + _transferencia.valor.toString()),
        subtitle: Text(_transferencia.destino),
      ),
    );
  }
}
