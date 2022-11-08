import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../authentication/login.dart';


class HomePageCliente extends StatelessWidget {
  const HomePageCliente(
      {Key? key, required this.entidad})
      : super(key: key);

  final TiendaEnt entidad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home cliente"),
        actions: [
          IconButton(
              key: const Key('ButtonHomeLogOff'),
              onPressed: () {
                /* Get.off(() => LoginScreen(
                      key: const Key('LoginScreen'),
                    )); */
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(key: const Key('TextHomeHello'), "Hello $entidad"),
            // ElevatedButton(
            //     key: const Key('ButtonHomeDetail'),
            //     onPressed: () {
            //       Get.to(() => const DetailPage(
            //             key: Key('DetailPage'),
            //           ));
            //     },
            //     child: const Text("Details")),
          ],
        ),
      ),
    );
  }
}