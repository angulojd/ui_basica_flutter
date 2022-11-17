import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import '../../../widgets/lista_productos_t.dart';
import 'add_product.dart';

class TiendaListProduts extends StatefulWidget {
  const TiendaListProduts({Key? key, required this.entidad}) : super(key: key);

  final TiendaEnt entidad;

  @override
  State<TiendaListProduts> createState() => _TiendaListProdutsState();
}

class _TiendaListProdutsState extends State<TiendaListProduts> {
  final AuthService auth = AuthService();
  RealTimeDB dbController = Get.find();

  get users => dbController.allUsers();

  TiendaEnt obteniendouser(users) {
    return users.firstWhere((element) => element.id == widget.entidad.id);
  }

  String obteniendouserdir(users) {
    TiendaEnt elegido =
        users.firstWhere((element) => element.id == widget.entidad.id);
    return elegido.dir;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Mis Productos"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                key: const Key('deleteAllButton'),
                onPressed: () {
                  //userController.deleteAll();
                },
                icon: const Icon(Icons.delete))
          ]),
      floatingActionButton: FloatingActionButton(
        key: const Key('addProductButton'),
        child: const Icon(Icons.add),
        onPressed: () async {
          Get.to(() => const AddProductT());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _getXlistView(),
      ),
    );
  }

  Widget _getXlistView() {
    return Obx(() => ListView.builder(
          itemCount: obteniendouser(users).productos.length,
          itemBuilder: (context, index) {
            final producto = obteniendouser(users).productos[index];
            return ListaProductosT(producto: producto);
          },
        ));
  }
}
