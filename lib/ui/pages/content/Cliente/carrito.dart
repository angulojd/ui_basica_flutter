import 'package:flutter/material.dart';

class Carrito extends StatefulWidget {
  Carrito(
      {super.key,
      required this.nombre,
      required this.tienda,
      required this.cantidad});
  final String nombre;
  final String tienda;
  final String cantidad;
  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          children: [
            Text(widget.nombre),
            Text(widget.tienda),
            Text(widget.cantidad),
          ],
        ),
      ),
    );
  }
}
