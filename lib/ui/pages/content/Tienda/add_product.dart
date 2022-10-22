
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_testing_template/domain/entities/tienda_entidad.dart';


class AddProductT extends StatefulWidget {
  const AddProductT(
      {Key? key,})
      : super(key: key);


  @override
  State<AddProductT> createState() => AddProductTState();
}

class AddProductTState extends State<AddProductT> {
  
  final controllerName = TextEditingController();
  final controllerType = TextEditingController();
  final controllerPeso = TextEditingController();
  final controllerCantidad = TextEditingController();
  final controllerPrecio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // UserController userController = Get.find();
    controllerName.text = "";
    controllerType.text = "";
    controllerPeso.text = "";
    controllerCantidad.text = "";
    controllerPrecio.text = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Producto"),
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
                key: const Key('TextFieldtype'),
                controller: controllerType,
                decoration: const InputDecoration(
                  labelText: 'Tipo',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                key: const Key('TextFieldpeso'),
                controller: controllerPeso,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                key: const Key('TextFieldcantidad'),
                controller: controllerCantidad,
                decoration: const InputDecoration(
                  labelText: 'Cantidad',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                key: const Key('TextFieldprecio'),
                controller: controllerPrecio,
                decoration: const InputDecoration(
                  labelText: 'Precio',
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