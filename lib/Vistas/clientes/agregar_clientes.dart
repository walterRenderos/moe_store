import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:moe_store/Modelos/cliente.dart';

// ignore: must_be_immutable
class AddCliente extends StatefulWidget {
  AddCliente({Key? key, required this.db}) : super(key: key);
  CLienteModelo db;
  @override
  _AddClienteState createState() => _AddClienteState();
}

class _AddClienteState extends State<AddCliente> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tipoController = TextEditingController();
  TextEditingController fechaController = TextEditingController();
  final format = DateFormat("dd-MM-yyyy hh:mm a");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Cliente"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Nombre del cliente'),
                controller: nombreController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          // ignore: deprecated_member_use
          child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                widget.db.create(nombreController.text, emailController.text);
                Navigator.pop(context, true);
              },
              child: const Text(
                "Guardar",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
