import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/productodb.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Carrito extends StatefulWidget {
  Carrito(
      {super.key,
      required this.nombre,
      required this.tienda,
      required this.cantidad,
      required this.precio});
  final String nombre;
  final String tienda;
  final String cantidad;
  final String precio;
  @override
  State<Carrito> createState() => _CarritoState();
}

String nombretienda(List<TiendaEnt> lista, String objetivo) {
  String papita = "";
  papita = lista.where((objeto) => objeto.id == objetivo).toList()[0].name;
  return papita;
}

class _CarritoState extends State<Carrito> {
  @override
  final AuthService _auth = AuthService();
  ProductoDB productcontroller = Get.find();
  RealTimeDB controller = Get.find();
  get products => productcontroller.allproducts();
  get users => controller.allUsers();

  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 200,
        width: 200,
        child: ElevatedButton(
          onPressed: (() {
            debugPrint("deberia hacer algo aqui?");
          }),
          child: Column(
            children: [
              Text(widget.nombre),
              Text(nombretienda(users, widget.tienda)),
              Text(widget.cantidad),
              Text(widget.precio),
            ],
          ),
        ),
      ),
    );
  }
}
