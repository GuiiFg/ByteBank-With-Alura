import 'package:flutter/material.dart';
import 'package:bytebank/models/controllers/Transferencias.dart';
import 'package:bytebank/components/ItemTransferencia.dart';
import 'FormularioTransferencia.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _listaTransferencia = [];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._listaTransferencia.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._listaTransferencia[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      appBar: AppBar(
        title: const Text("ByteBank"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle_outline),
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTranseferencia();
          }));
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              setState(() {
                widget._listaTransferencia.add(transferenciaRecebida);
              });
            }
          });
        },
      ),
    );
  }
}
