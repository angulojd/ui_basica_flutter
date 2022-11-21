import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_testing_template/domain/entities/tienda_entidad.dart';

class EditarDatosTienda extends StatefulWidget {
  const EditarDatosTienda({Key? key, required this.entidad}) : super(key: key);

  final TiendaEnt entidad;

  @override
  State<EditarDatosTienda> createState() => _EditarDatosTiendastate();
}

class _EditarDatosTiendastate extends State<EditarDatosTienda> {
  final controllerName = TextEditingController();
  final controllerDir = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RealTimeDB dbController = Get.find();
    AuthService authController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar Datos',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextField(
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      controller: controllerName,
                      decoration: const InputDecoration(labelText: 'Nombre')),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      key: const Key('TextFieldDir'),
                      controller: controllerDir,
                      decoration: const InputDecoration(
                        labelText: 'Dirección',
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 15.0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                    ),
                    onPressed: () async {
                      try {
                        if (controllerName.text.isNotEmpty &&
                            controllerDir.text.isNotEmpty) {
                          await dbController.updateUser(controllerName.text,
                              controllerDir.text, authController.getUid());
                          Get.back();
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Campos vacíos'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } catch (e) {
                        // ignore: avoid_print
                        print(e);
                        return Future.error(e);
                      }
                    },
                    child: const Text(
                      "Guardar",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
