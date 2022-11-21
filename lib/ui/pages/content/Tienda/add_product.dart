import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/productodb.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductT extends StatefulWidget {
  const AddProductT({
    Key? key,
  }) : super(key: key);

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

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/back.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            "Nuevo Producto",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Column(
            children: [
              Container(
                width: 400,
                height: 373,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 154, 154, 154),
                      offset: Offset(0.0, 10.0),
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                        style: const TextStyle(
                          fontSize: 19,
                        ),
                        controller: controllerName,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                        style: const TextStyle(
                          fontSize: 19,
                        ),
                        key: const Key('TextFieldtype'),
                        controller: controllerType,
                        decoration: const InputDecoration(
                          labelText: 'Tipo',
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                        style: const TextStyle(
                          fontSize: 19,
                        ),
                        key: const Key('TextFieldpeso'),
                        controller: controllerPeso,
                        decoration: const InputDecoration(
                          labelText: 'Peso',
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                        style: const TextStyle(
                          fontSize: 19,
                        ),
                        key: const Key('TextFieldcantidad'),
                        controller: controllerCantidad,
                        decoration: const InputDecoration(
                          labelText: 'Cantidad',
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                        style: const TextStyle(
                          fontSize: 19,
                        ),
                        key: const Key('TextFieldprecio'),
                        controller: controllerPrecio,
                        decoration: const InputDecoration(
                          labelText: 'Precio',
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 240,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 15.0,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                    ),
                    onPressed: () async {
                      if (controllerName.text.isNotEmpty &&
                          controllerType.text.isNotEmpty &&
                          controllerPeso.text.isNotEmpty &&
                          controllerCantidad.text.isNotEmpty &&
                          controllerPrecio.text.isNotEmpty) {
                        ProductoDB productoController = Get.find();
                        AuthService authController = Get.find();
                        try {
                          await productoController.createProducto(controllerName.text, controllerType.text,
                              controllerPeso.text, controllerCantidad.text, controllerPrecio.text, authController.getUid());
                        } catch (e) {
                          // ignore: avoid_print
                          print(e.toString());
                        }
                        Get.back();
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Campos vacíos'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      // await userController.updateUser(userM);
                    },
                    child: const Text(
                      "Guardar",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
