import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Menu(
      {required this.titulo,
      required this.icono,
      required this.warma,
      required this.pagina});
  final String titulo;
  final IconData icono;
  final MaterialColor warma;
  // ignore: prefer_typing_uninitialized_variables
  final Widget pagina;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8.0),
      elevation: 10,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => pagina));
        },
        splashColor: Colors.yellow,
        child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Icon(
            icono,
            size: 70.0,
            color: warma,
          ),
          // ignore: prefer_const_constructors
          Text(
            titulo,
            style: const TextStyle(fontSize: 17.0),
          ),
        ])),
      ),
    );
  }
}
