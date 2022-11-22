import 'dart:convert';

import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../domain/entities/tienda_entidad.dart';
import '../ui/pages/content/Tienda/editar_datos_tienda.dart';

class MapaUI extends StatefulWidget {
  const MapaUI({Key? key, required this.entidad}) : super(key: key);

  final TiendaEnt entidad;

  @override
  State<MapaUI> createState() => _MapaUIState();
}

class _MapaUIState extends State<MapaUI> {
  _MapaUIState();

  List<Marker> allMarkers = [];
  LatLng? _ultimotap;

  Color color = Colors.black;

  static const CameraPosition _positionInicial = CameraPosition(
    target: LatLng(10.96, -74.7971),
    zoom: 11.0,
  );

  CameraPosition _posicion = _positionInicial;
  bool _estaMapaCreado = false;
  bool _estaMoviendose = false;
  bool _brujulaActivada = true;
  bool _barraHerramientasMapaActivada = true;
  CameraTargetBounds _limitesCamara = CameraTargetBounds.unbounded;
  MinMaxZoomPreference _preferenciasMinMaxZoom = MinMaxZoomPreference.unbounded;
  MapType _tipoMapa = MapType.normal;
  bool _gestoRotacionActivado = true;
  bool _gestoScrrollActivadp = true;
  bool _gestoInclinacionActivado = true;
  bool _controlesZoomActivos = true;
  bool _gestoZoomActivo = true;
  bool _vistaInteriorActiva = true;
  bool _miTraficoActivo = true;
  bool _botomLocalizacionActivado = true;
  late GoogleMapController _controller;
  bool _modoNocturno = false;
  bool _localizacionActiva = true;

  @override
  Widget build(BuildContext context) {
    RealTimeDB dbController = Get.find();
    AuthService authController = Get.find();

    final GoogleMap googleMap = GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: _positionInicial,
      compassEnabled: _brujulaActivada,
      mapToolbarEnabled: _barraHerramientasMapaActivada,
      cameraTargetBounds: _limitesCamara,
      minMaxZoomPreference: _preferenciasMinMaxZoom,
      mapType: _tipoMapa,
      rotateGesturesEnabled: _gestoRotacionActivado,
      scrollGesturesEnabled: _gestoScrrollActivadp,
      tiltGesturesEnabled: _gestoInclinacionActivado,
      zoomGesturesEnabled: _gestoZoomActivo,
      zoomControlsEnabled: _controlesZoomActivos,
      indoorViewEnabled: _vistaInteriorActiva,
      myLocationEnabled: _localizacionActiva,
      myLocationButtonEnabled: _miTraficoActivo,
      onCameraMove: _actualizarPosicionCamara,
      onTap: (LatLng pos) {
        allMarkers.add(Marker(
            markerId: const MarkerId('mymarker'),
            draggable: true,
            position: pos,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen)));
        setState(() {
          _ultimotap = pos;
        });
      },
      markers: Set.from(allMarkers),
    );

    final List<Widget> columnChildren = <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Center(
            child: SizedBox(
          width: 400,
          height: 400,
          child: googleMap,
        )),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _botonDarkMode(),
        const SizedBox(
          width: 30,
        ),
        _botonTipoMapa(),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 120,
          height: 60,
          child: OutlinedButton(
            key: const Key('ButtonEditTienda'),
            onPressed: () async {
              try {
                await dbController.updateUserDir(
                    _ultimotap.toString(), authController.getUid());
              } catch (e) {
                // ignore: avoid_print
                print(e);
                return Future.error(e);
              }
              Get.back();
              // Get.to(() => EditarDatosTienda(entidad: widget.entidad, dir: _ultimotap.toString()));
            },
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              elevation: 15.0,
              backgroundColor: const Color(0xFF00BE5D),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
            ),
            child: const Text(
              "Guardar",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
      // _botonMiLocalizacion()
    ];

    /* if(_estaMapaCreado){
        columnChildren.add(
          Expanded(
            child: ListView(
              children: <Widget>[
                Text('Objetivo Cámara: ${_posicion.target.latitude.toStringAsFixed(4)},'
                '${_posicion.target.longitude.toStringAsFixed(4)}'
                ),
                Text('Zoom cámara: ${_posicion.zoom}'),
                Text('Inclinacion cámara: ${_posicion.tilt}'),
                // _botonBrujula()
              ],
              )
            ) 
        );
      } */
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Elije tu ubicación",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: columnChildren,
      ),
    );
  }

  Future<String> _leerFichero(String ruta) async {
    return await rootBundle.loadString(ruta);
  }

  void _cargarMapaStilo(String mapaEstilo) {
    setState(() {
      _modoNocturno = true;
      _controller.setMapStyle(mapaEstilo);
    });
  }

  Widget _botonDarkMode() {
    // assert(_estaMapaCreado);
    return SizedBox(
      width: 60,
      height: 60,
      child: CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFF00BE5D),
          child: IconButton(
            color: color,
            iconSize: 35,
            tooltip: 'Modo oscuro',
            icon: const Icon(Icons.sunny),
            onPressed: () {
              if (_modoNocturno) {
                _modoNocturno = false;
                _controller.setMapStyle(null);
                setState(() {
                  color = Colors.black;
                });
              } else {
                color = Colors.amber;
                _leerFichero("assets/night_mode.json").then(_cargarMapaStilo);
              }
            },
          )),
    );
  }

  Widget _botonTipoMapa() {
    final MapType siguienteTipo =
        MapType.values[(_tipoMapa.index + 1) % MapType.values.length];
    return SizedBox(
      width: 60,
      height: 60,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: const Color(0xFF00BE5D),
        child: IconButton(
          color: Colors.white,
          iconSize: 35,
          tooltip: 'Tipo Mapa',
          icon: const Icon(Icons.satellite_alt),
          onPressed: () {
            setState(() {
              _tipoMapa = siguienteTipo;
            });
          },
        ),
      ),
    );
  }

  Widget _botonMiLocalizacion() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: 250,
        height: 50,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              _localizacionActiva = !_localizacionActiva;
            });
          },
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            elevation: 15.0,
            backgroundColor: const Color(0xFF00BE5D),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
          ),
          child: Text(
            '${_localizacionActiva ? 'Desactivar' : 'Activar'} marca de localizacion',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _actualizarPosicionCamara(CameraPosition posicion) {
    setState(() {
      _posicion = posicion;
    });
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
      _estaMapaCreado = true;
    });
  }
}
