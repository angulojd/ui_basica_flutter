// ignore_for_file: avoid_print

import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:f_testing_template/ui/pages/authentication/auth_page.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/lista_tiendas.dart';
import 'package:f_testing_template/ui/pages/content/Tienda/home_tienda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TiendaEnt?>(context);
    RealTimeDB dbController = Get.find();
    dbController.start();

    //return home or authentication page
    if (user == null) {
      return const AuthPage();
    } else {

      print("en login está: ${user.id}");
      List<TiendaEnt> users = dbController.allUsers();
      TiendaEnt elegido = users.firstWhere((element) => element.id == user.id);

      if (elegido.type == 'Tienda') {

        return HomePageTienda(entidad: elegido);

      } else {

        return const ListTiendas(); 

      }
    }
  }
}
