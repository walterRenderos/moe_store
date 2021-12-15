import 'package:cloud_firestore/cloud_firestore.dart';

class Plato {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(
      String nombre,
      String restaurante,
      String precio) async {
    try {
      await firestore.collection("equipos").add({
        'nombre': nombre,
        'restaurante': restaurante,
        'precio': precio
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}