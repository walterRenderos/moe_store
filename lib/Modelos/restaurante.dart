import 'package:cloud_firestore/cloud_firestore.dart';

class RestauranteModelo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  //metodo para agregar
  Future<void> create(String nombre, String direccion, String email,
      String latitud, String longitud, String logo) async {
    try {
      await firestore.collection("Restaurantes").add({
        'Nombre': nombre,
        'Direccion': direccion,
        'Email': email,
        'Latitud': latitud,
        'Longitud': longitud,
        'logo': logo
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> update(String id, String nombre, String direccion, String email,
      String latitud, String longitud, String logo) async {
    try {
      await firestore.collection("Restaurantes").doc(id).update({
        'Nombre': nombre,
        'Direccion': direccion,
        'Email': email,
        'Latitud': latitud,
        'Longitud': longitud,
        'logo': logo
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("Restaurantes").doc(id).delete();
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
      querySnapshot = await firestore.collection('Restaurantes').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "Nombre": doc.get('Nombre'),
            "Direccion": doc.get('Direccion'),
            "Email": doc.get('Email'),
            "Latitud": doc.get('Latitud'),
            "Longitud": doc.get('Longitud'),
            "logo": doc.get('logo')
          };
          docs.add(a);
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    // ignore: avoid_print
    return docs;
  }
}
