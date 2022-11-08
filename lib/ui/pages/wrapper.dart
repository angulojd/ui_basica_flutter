import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import 'package:f_testing_template/ui/pages/authentication/auth_page.dart';
import 'package:f_testing_template/ui/pages/content/Tienda/home_tienda.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TiendaEnt?>(context);
    //return home or authentication page
    if (user == null) {
      // ignore: avoid_print
      print("no está logeado");
      return const AuthPage();
    } else {
      // ignore: avoid_print
      print("en login está: ${user.id}");
      return const HomePageTienda();
    }
  }
}
