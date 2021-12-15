import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moe_store/Modelos/restaurante.dart';
import 'package:moe_store/componentes/mapa_controller.dart';

class Sucursal extends StatefulWidget {
  const Sucursal({Key? key}) : super(key: key);

  @override
  _SucursalState createState() => _SucursalState();
}

class _SucursalState extends State<Sucursal> {
  RestauranteModelo restaurantes = RestauranteModelo();
  final Set<Marker> listMarkers = {};
  List documentos = [];
  initialiase() {
    restaurantes.initiliase();
    restaurantes.read().then((value) => {
          setState(() {
            // listMarkers.add(const Marker(
            //   markerId: MarkerId("1"),
            //   position: LatLng(13.707555556517736, -89.14164035699251),
            //   infoWindow:
            //       InfoWindow(title: "MovelSV Soyapango", snippet: "Sucursal Soyapango"),
            //   icon: BitmapDescriptor.defaultMarker,
            // ));
            documentos = value;
          })
        });
  }
  final _controller = HomeController();
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(13.6979572, -89.1733809), zoom: 12);
  @override
  void initState() {
    super.initState();
    initialiase();
  }
  @override
  Widget build(BuildContext context) {
        for (var item in documentos) {
          var latitud = double.parse(item['Latitud']);
          var longitud = double.parse(item['Longitud']);
          listMarkers.add(Marker(
            markerId: MarkerId(item['id']),
            position: LatLng(latitud, longitud),
            infoWindow:
                InfoWindow(title: item['Nombre'].toString(), snippet: item['Direccion'].toString()),
            icon: BitmapDescriptor.defaultMarker,
          ));
        }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sucursales"),
      ),
      body: Center(
        child: GoogleMap(
          onMapCreated: _controller.onMapCreated,
          initialCameraPosition: _initialCameraPosition,
          myLocationButtonEnabled: false,
          myLocationEnabled: false,
          zoomControlsEnabled: true,
          markers: listMarkers,
        )
      ),
    );
  }
}
