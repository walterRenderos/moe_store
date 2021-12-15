import 'package:flutter/material.dart';
import 'package:moe_store/Vistas/clientes/agregar_clientes.dart';
import 'package:moe_store/Vistas/clientes/ver_clientes.dart';
import 'package:moe_store/Modelos/cliente.dart';

class Clientes extends StatefulWidget {
  const Clientes({Key? key}) : super(key: key);

  @override
  _ClientesState createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  CLienteModelo cliente = CLienteModelo();
  List documentos = [];
  initialiase() {
    cliente.initiliase();
    cliente.read().then((value) => {
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
        title: const Text("Clientes"),
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
                            builder: (context) =>
                                VerCliente(cliente: documentos[index], cl: cliente)))
                    .then((value) => {
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
                  context, MaterialPageRoute(builder: (context) => AddCliente(db: cliente)))
              .then((value) {
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
