import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/mapa.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:f_testing_template/ui/pages/content/Tienda/home_tienda.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_testing_template/domain/entities/tienda_entidad.dart';

class EditarDatosTienda extends StatefulWidget {
  const EditarDatosTienda({Key? key, required this.entidad, required this.dir})
      : super(key: key);

  final TiendaEnt entidad;
  final String dir;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "Dirección  ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 105, 105, 105),
                                    fontFamily: 'LatoRegular',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            WidgetSpan(
                              child: Icon(
                                Icons.map_sharp,
                                size: 20,
                                color: Color(0xFF00BE5D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Get.to(() => MapaUI(
                                entidad: widget.entidad,
                              ));
                        },
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 15.0,
                          backgroundColor: const Color(0xFF00BE5D),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                        ),
                        child: const Text(
                          "Buscar",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  TextField(
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      controller: controllerName,
                      decoration: const InputDecoration(labelText: 'Nombre')),
                  const SizedBox(
                    height: 20,
                  ),
                  /* TextField(
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      key: const Key('TextFieldDir'),
                      controller: controllerDir,
                      decoration: const InputDecoration(
                        labelText: 'Dirección',
                      )), */
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
                        if (controllerName.text.isNotEmpty) {
                          await dbController.updateUser(
                              controllerName.text, authController.getUid());
                          Get.back();
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Se tomó el nombre por defecto'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Get.back();
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
