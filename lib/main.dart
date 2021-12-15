import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moe_store/paginas/inicio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MoeApp());
}

class MoeApp extends StatelessWidget {
  const MoeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moes_Store',
      theme: ThemeData(),
      home: const Inicio(),
    );
  }
}
