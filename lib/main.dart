import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/pages/authentication/login.dart';
import 'package:f_testing_template/domain/entities/tienda_entidad.dart';

void main() {
  runApp(const MyApp());
}

const String email1 = "cliente@uninorte.com";
const String type1 = "Cliente";
TiendaEnt tienda =  TiendaEnt(name: 'Tienda la Hormiguita', email: 'a@a', password: '123456', picture: 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Sortavala_market_place.jpg/220px-Sortavala_market_place.jpg', dir: 'Cr 42 A # 55 E 43 / Soledad');
const String password = "123456";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'MÉRCATE',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(
          key: const Key('LoginScreen'),
          entidad: tienda,
        ));
  }
}
