import 'dart:ffi';
import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/productodb.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/Lista.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/carrito.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/recibo.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final AuthService auth = AuthService();
  ProductoDB productoController = Get.find();
  get products => productoController.allproducts();

  String calcularcarrito(List<ProductoEnt> products) {
    debugPrint(products.length.toString());
    bool satisfecho;
    List<ProductoEnt> temp = [];
    int j;
    for (int k = 0; k < Listilla.cantidadescarrito.length; k++) {
      temp = products
          .where((objeto) => objeto.name == Listilla.nombrescarrito[k])
          .toList();
      satisfecho = false;
      j = 0;
      debugPrint(temp.length.toString());
      while (!satisfecho) {
        if (int.parse(temp[j].cantidad) >=
            int.parse(Listilla.cantidadescarrito[k])) {
          Recibo.cantidadproducto.add(Listilla.cantidadescarrito[k]);
          Recibo.nombreproducto.add(temp[j].name);
          Recibo.nombretienda.add(temp[j].dueno.toString());
          satisfecho = true;
        } else {
          Recibo.cantidadproducto.add(temp[j].cantidad);
          Recibo.nombreproducto.add(temp[j].name);
          Recibo.nombretienda.add(temp[j].dueno.toString());
        }
        j++;
      }
    }
    for (int p = 0; p < Recibo.cantidadproducto.length; p++) {
      debugPrint(Recibo.cantidadproducto[p]);
      debugPrint(Recibo.nombreproducto[p]);
      debugPrint(Recibo.nombretienda[p]);
    }
    return "hola";
    //var visto = Set<String>();
    //List<ProductoEnt> lista = products.where((p) => visto.add(p.type)).toList();
    //return lista;
    // return products.firstWhere((element) => element.dueno == widget.entidad.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(child: generador()),
    );
  }

  Widget generador() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12),
      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      itemCount: calcularcarrito(products).length,
      itemBuilder: (context, index) {
        final name = Recibo.nombreproducto[index];
        final store = Recibo.nombretienda[index];
        final cuant = Recibo.cantidadproducto[index];
        return Carrito(nombre: name, tienda: store, cantidad: cuant);
      },
    );
  }
}
