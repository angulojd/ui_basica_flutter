import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import '../../../widgets/lista_productos_t.dart';
import 'add_product.dart';



class TiendaListProduts extends StatelessWidget {
  const TiendaListProduts({Key? key, required this.entidad}) : super(key: key);

  final TiendaEnt entidad;


  @override
  Widget build(BuildContext context) {
    //HomeController controller = Get.find();
    //UserController userController = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Productos"), actions: <Widget>[
        IconButton(
            key: Key('deleteAllButton'),
            onPressed: () {
              //userController.deleteAll();
            },
            icon: Icon(Icons.delete))
      ]),
      floatingActionButton: /*GetX<HomeController>(*/
        /*builder: (controller) {
          return*/ FloatingActionButton(
            key: Key('addProductButton'),
            /* child: Icon(controller.connection
                ? Icons.add
                : Icons.portable_wifi_off_rounded), */
                child: const Icon(Icons.add),
            onPressed: () async {
              if (true/* controller.connection */) {
                //await userController.addUser();
                Get.to(() => AddProductT());

              } else {
                Get.snackbar('Refresh failed!', "Can't get users",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red);
              }
            },
          ),
          
      

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _getXlistView(),
      ),
    );
  }

  Widget _getXlistView() {
    //UserController userController = Get.find();
    return /*Obx(
      () => */ListView.builder(
        itemCount: entidad.productos.length/*userController.users.length*/,
        itemBuilder: (context, index) {
          final producto = /*userController.users[index]*/entidad.productos[index];
          return ListaProductosT(producto: producto);
        },
      );
    /* ); */
  }
}