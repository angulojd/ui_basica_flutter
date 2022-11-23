// ignore_for_file: avoid_print

import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:f_testing_template/ui/pages/authentication/auth_page.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/lista_tiendas.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/vista_categorias.dart';
import 'package:f_testing_template/ui/pages/content/Tienda/home_tienda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'dart:async';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  var aux = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TiendaEnt?>(context);
    RealTimeDB dbController = Get.find();

    TiendaEnt obteniendouser(users) {
      return users.firstWhere((element) => element.id == user!.id);
    }

    Timer(const Duration(seconds: 7), () {
      setState(() {
        aux = true;
      });
    });

    //return home or authentication page
    if (user == null) {
      return const AuthPage();
    } else {
      if (aux == false) {
        return const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            backgroundColor: Colors.cyanAccent,
            strokeWidth: 10,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        );
      } else {
        TiendaEnt elegido = obteniendouser(dbController.allUsers());
        if (elegido.type == 'Tienda') {
          return HomePageTienda(entidad: elegido);
        } else {
          return const CategoryViewPage();
        }
      }
    }
  }
}
