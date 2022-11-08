import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/ui/pages/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<TiendaEnt?>.value(
      value: AuthService().user,
      initialData: null,
      child: GetMaterialApp(
          title: 'MÉRCATE',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Wrapper(key: Key('WrapperScreen'))),
    );
  }
}
