import 'package:cloud_firestore/cloud_firestore.dart';

class Plato {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(
      String cliente,
      String plato,
      String fecha,
      String direccionEntrega,
      String motorista,
      String precio,
      String isv,
      String total) async {
    try {
      await firestore.collection("equipos").add({
        'cliente': cliente,
        'plato': plato,
        'fecha': fecha,
        'direccionEntrega': direccionEntrega,
        'motorista': motorista,
        'precio': precio,
        'isv': isv,
        'total': total
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}