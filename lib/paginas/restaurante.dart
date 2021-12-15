import 'package:flutter/material.dart';
import 'package:moe_store/Modelos/restaurante.dart';
import 'package:moe_store/Vistas/restaurantes/agregar_restaurantes.dart';
import 'package:moe_store/Vistas/restaurantes/ver_restaurante.dart';

class Restaurante extends StatefulWidget {
  const Restaurante({Key? key}) : super(key: key);

  @override
  _RestauranteState createState() => _RestauranteState();
}

class _RestauranteState extends State<Restaurante> {
  RestauranteModelo restaurante = RestauranteModelo();
  List documentos = [];
  initialiase() {
    restaurante.initiliase();
    restaurante.read().then((value) => {
          setState(() {
            documentos = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialiase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurantes"),
      ),
      body: ListView.builder(
        itemCount: documentos.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerRestaurante(
                            restaurante: documentos[index],
                            cl: restaurante))).then((value) => {
                      if (value != null) {initialiase()}
                    });
              },
              contentPadding: const EdgeInsets.only(right: 30, left: 36),
              title: Text(documentos[index]['Nombre']),
              trailing: Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.yellow.shade800,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddRestaurante(
                        db: restaurante,
                        key: null,
                      ))).then((value) {
            if (value != null) {
              initialiase();
            }
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
