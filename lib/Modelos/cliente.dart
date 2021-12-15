import 'package:cloud_firestore/cloud_firestore.dart';

class CLienteModelo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  //metodo para agregar
  Future<void> create(String nombre, String email) async {
    try {
      await firestore.collection("Clientes").add({
        'Nombre': nombre,
        'Email': email,
        'fechaIngreso': FieldValue.serverTimestamp(),
        'tipo': 'Ciente'
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> update(String id, String nombre, String email) async {
    try {
      await firestore
          .collection("Clientes")
          .doc(id)
          .update({'Nombre': nombre, 'Email': email});
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("Clientes").doc(id).delete();
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
      querySnapshot = await firestore.collection('Clientes').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "Nombre": doc.get('Nombre'),
            "Email": doc.get('Email'),
            "fechaIngreso":
                DateTime.parse(doc.get('fechaIngreso').toDate().toString()),
            "tipo": doc.get('tipo')
          };
          print(DateTime.parse(doc.get('fechaIngreso').toDate().toString()));
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
