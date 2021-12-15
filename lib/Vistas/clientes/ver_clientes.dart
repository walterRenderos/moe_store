import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:moe_store/Modelos/cliente.dart';

// ignore: must_be_immutable
class VerCliente extends StatefulWidget {
  VerCliente({Key? key, required this.cliente, required this.cl})
      : super(key: key);
  Map cliente;
  CLienteModelo cl;
  @override
  _VerClienteState createState() => _VerClienteState();
}

class _VerClienteState extends State<VerCliente> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tipoController = TextEditingController();
  final format = DateFormat("dd-MM-yyyy hh:mm a");
  // ignore: prefer_typing_uninitialized_variables
  DateTime fecha = DateTime.now();

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print(widget.cliente);
    nombreController.text = widget.cliente['Nombre'];
    emailController.text = widget.cliente['Email'];
    fecha = widget.cliente['fechaIngreso'];
    tipoController.text = widget.cliente['tipo'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cliente Seleccionado"),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                widget.cl.delete(widget.cliente["id"]);
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
              DateTimeField(
                format: format,
                decoration:
                    const InputDecoration(labelText: 'Fecha y hora de ingreso'),
                initialValue: fecha,
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue!,
                      lastDate: DateTime(2100));
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(currentValue),
                    );
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'tipo'),
                controller: tipoController,
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
              widget.cl.update(widget.cliente['id'], nombreController.text,
                  emailController.text);
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
