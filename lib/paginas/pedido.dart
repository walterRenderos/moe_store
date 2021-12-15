import 'package:flutter/material.dart';

class Pedido extends StatefulWidget {
  const Pedido({Key? key}) : super(key: key);

  @override
  _PedidoState createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedidos"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: const EdgeInsets.all(30.0),
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[const Text("pagina de Pedidos")],
            ),
          ),
        ],
      ),
    );
  }
}
