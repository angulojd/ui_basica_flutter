

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
    // UserController userController = Get.find();
    controllerName.text = widget.entidad.name;
    controllerDir.text = widget.entidad.dir;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entidad.name),
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
                            TiendaEnt tiendaN = widget.entidad;
                            tiendaN.name = controllerName.text;
                            tiendaN.dir = controllerDir.text;
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