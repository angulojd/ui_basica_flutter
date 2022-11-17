import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_testing_template/domain/entities/tienda_entidad.dart';


class EditarDatosTienda extends StatefulWidget {
  const EditarDatosTienda(
      {Key? key, required this.entidad})
      : super(key: key);

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
        title: const Text('Editar Datos'),
        centerTitle: true,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerName,
                decoration: const InputDecoration(
                  labelText: 'Name',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                key: const Key('TextFieldDir'),
                controller: controllerDir,
                decoration: const InputDecoration(
                  labelText: 'Dir',
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () async {
                            try {
                              await dbController.updateUser(controllerName.text, controllerDir.text, authController.getUid());
                            } catch (e) {
                              // ignore: avoid_print
                              print(e);
                              return Future.error(e);
                            }
                            
                            // TiendaEnt tiendaN = widget.entidad;
                            /* tiendaN.name = controllerName.text;
                            tiendaN.dir = controllerDir.text; */
                            // await userController.updateUser(userM);
                            Get.back();
                          },
                          child: const Text("Guardar")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}