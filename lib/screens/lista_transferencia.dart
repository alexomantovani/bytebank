import 'package:flutter/material.dart';

import '/models/transferencia.dart';
import './formulario.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  State<ListaTransferencias> createState() => _ListaTransferenciasState();
}

class _ListaTransferenciasState extends State<ListaTransferencias> {
  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, index) {
          Transferencia transferencia = _transferencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Future<dynamic> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));

          future.then(
              (transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    setState(
      () => _transferencias.add(transferenciaRecebida),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(
    this._transferencia, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
