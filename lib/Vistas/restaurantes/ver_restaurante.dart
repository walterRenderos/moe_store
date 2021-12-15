import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moe_store/Modelos/restaurante.dart';

// ignore: must_be_immutable
class VerRestaurante extends StatefulWidget {
  VerRestaurante({Key? key, required this.restaurante, required this.cl})
      : super(key: key);
  Map restaurante;
  RestauranteModelo cl;
  @override
  _VerRestauranteState createState() => _VerRestauranteState();
}

class _VerRestauranteState extends State<VerRestaurante> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController latitudController = TextEditingController();
  TextEditingController longitudController = TextEditingController();
  TextEditingController logoController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  final format = DateFormat("dd-MM-yyyy hh:mm a");
  late DateTime fecha;

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print(widget.restaurante);
    nombreController.text = widget.restaurante['Nombre'];
    emailController.text = widget.restaurante['Email'];
    latitudController.text = widget.restaurante['Latitud'];
    longitudController.text = widget.restaurante['Longitud'];
    direccionController.text = widget.restaurante['Direccion'];
    logoController.text = widget.restaurante['logo'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurante Seleccionado"),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                widget.cl.delete(widget.restaurante["id"]);
                Navigator.pop(context, true);
              })
        ],
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
              widget.cl.update(
                  widget.restaurante['id'],
                  nombreController.text,
                  direccionController.text,
                  emailController.text,
                  latitudController.text,
                  longitudController.text,
                  logoController.text);
              Navigator.pop(context, true);
            },
            child: const Text(
              "Actualizar",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
