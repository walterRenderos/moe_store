import 'package:flutter/material.dart';

class Plato extends StatefulWidget {
  const Plato({Key? key}) : super(key: key);

  @override
  _PlatoState createState() => _PlatoState();
}

class _PlatoState extends State<Plato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Platos"),
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
              children: <Widget>[const Text("pagina de Platos")],
            ),
          ),
        ],
      ),
    );
  }
}
