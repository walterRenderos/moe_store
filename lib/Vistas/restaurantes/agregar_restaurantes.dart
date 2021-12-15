import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moe_store/Modelos/restaurante.dart';

// ignore: must_be_immutable
class AddRestaurante extends StatefulWidget {
  AddRestaurante({Key? key, required this.db}) : super(key: key);
  RestauranteModelo db;
  @override
  _AddRestauranteState createState() => _AddRestauranteState();
}

class _AddRestauranteState extends State<AddRestaurante> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController latitudController = TextEditingController();
  TextEditingController longitudController = TextEditingController();
  TextEditingController logoController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
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
                    const InputDecoration(labelText: 'Nombre del restaurante'),
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
              TextFormField(
                decoration: const InputDecoration(labelText: 'Direccion'),
                controller: direccionController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Latitud'),
                controller: latitudController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Longitud'),
                controller: longitudController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Logo'),
                controller: logoController,
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
                widget.db.create(
                    nombreController.text,
                    direccionController.text,
                    emailController.text,
                    latitudController.text,
                    longitudController.text,
                    logoController.text);
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
