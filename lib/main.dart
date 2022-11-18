import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/ui/pages/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:f_testing_template/config/_configuration_dart';
import 'package:f_testing_template/services/realdb.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "pro",
      options: const FirebaseOptions(
        apiKey: Configuration.apiKey,
        authDomain: Configuration.authDomain,
        databaseURL: Configuration.databaseURL,
        projectId: Configuration.projectId,
        messagingSenderId: Configuration.messagingSenderId,
        appId: Configuration.appId,
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RealTimeDB());
    Get.put(AuthService());
    RealTimeDB dbController = Get.find();
    dbController.start();
    // AuthService().signOut();

    return StreamProvider<TiendaEnt?>.value(
      value: AuthService().user,
      initialData: null,
      child: GetMaterialApp(
          title: 'MÉRCATE',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'LatoRegular',
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xFF00BE5D),
            ),
          ),
          home: const Wrapper(key: Key('WrapperScreen'))),
    );
  }
}
