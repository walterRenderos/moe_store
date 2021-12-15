import 'package:cloud_firestore/cloud_firestore.dart';

class Motorista {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  //Metodo para agregar
  Future<void> create(
      String nombre,
      String fechaNacimiento,
      String fechaIngreso) async {
    try {
      await firestore.collection("equipos").add({
        'nombre': nombre,
        'fechaNacimiento': fechaNacimiento,
        'fechaIngreso': fechaIngreso
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  //metodo para leer
  Future<List> read() async {
  QuerySnapshot querySnapshot;
  List docs = [];
  try {
    querySnapshot = await firestore.collection('equipos').get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs.toList()) {
        Map a = {
          "id": doc.id,
          "nombre": doc['nombre'],
          "email": doc['email'],
          "fechaIngreso": doc['fechaIngreso'],
          "tipo": doc['tipo']
        };
        docs.add(a);
      }
    }
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
  return docs;
  }
}