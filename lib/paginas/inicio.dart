import 'package:flutter/material.dart';
import 'package:moe_store/componentes/menu_principal.dart';
import 'package:moe_store/paginas/clientes.dart';
import 'package:moe_store/paginas/motorista.dart';
import 'package:moe_store/paginas/pedido.dart';
import 'package:moe_store/paginas/platos.dart';
import 'package:moe_store/paginas/restaurante.dart';
import 'package:moe_store/paginas/sucursales.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moe's"),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/images/moe.jpg',
              height: 193,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: const EdgeInsets.all(30.0),
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const Menu(
                  icono: Icons.people_outline_outlined,
                  titulo: 'Clientes',
                  warma: Colors.red,
                  pagina: Clientes(),
                ),
                const Menu(
                  icono: Icons.storefront_outlined,
                  titulo: 'Restaurantes',
                  warma: Colors.red,
                  pagina: Restaurante(),
                ),
                const Menu(
                  icono: Icons.delivery_dining_outlined,
                  titulo: 'Motorista',
                  warma: Colors.red,
                  pagina: Motorista(),
                ),
                const Menu(
                  icono: Icons.fastfood_outlined,
                  titulo: 'Platos',
                  warma: Colors.red,
                  pagina: Plato(),
                ),
                const Menu(
                  icono: Icons.menu_book_outlined,
                  titulo: 'Pedidos',
                  warma: Colors.red,
                  pagina: Pedido(),
                ),
                const Menu(
                  icono: Icons.location_on_outlined,
                  titulo: 'Sucursales',
                  warma: Colors.red,
                  pagina: Sucursal(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
