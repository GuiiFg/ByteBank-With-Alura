import 'package:flutter/material.dart';
import 'screens/ListaTransferencia.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaTransferencia(),
      theme: ThemeData.dark(),
    );
  }
}
