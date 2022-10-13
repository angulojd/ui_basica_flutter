import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/pages/authentication/login.dart';

void main() {
  runApp(const MyApp());
}

const String email1 = "cliente@uninorte.com";
const String type1 = "Cliente";
const String email2 = "tienda@uninorte.com";
const String type2 = "Tienda";
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
        home: const LoginScreen(
          key: Key('LoginScreen'),
          email: email2,
          password: password,
          type: type2,
        ));
  }
}
