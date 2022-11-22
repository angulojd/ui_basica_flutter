import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:f_testing_template/ui/pages/content/Tienda/balance_tienda.dart';
import 'package:f_testing_template/ui/pages/content/Tienda/editar_datos_tienda.dart';
import 'package:f_testing_template/ui/pages/content/Tienda/tienda_list_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/entities/tienda_entidad.dart';
import '../../../widgets/banner.dart';

class HomePageTienda extends StatefulWidget {
  const HomePageTienda({Key? key, required this.entidad}) : super(key: key);

  final TiendaEnt entidad;

  @override
  State<HomePageTienda> createState() => _HomePageTiendaState();
}

class _HomePageTiendaState extends State<HomePageTienda> {
  final AuthService _auth = AuthService();
  RealTimeDB dbController = Get.find();

  get users => dbController.allUsers();

  String obteniendousername(users) {
    TiendaEnt elegido =
        users.firstWhere((element) => element.id == widget.entidad.id);
    return elegido.name;
  }

  String obteniendouserdir(users) {
    TiendaEnt elegido =
        users.firstWhere((element) => element.id == widget.entidad.id);
    return elegido.dir;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              key: const Key('ButtonHomeTiendaEditar'),
              iconSize: 25,
              tooltip: 'Editar Datos',
              onPressed: () {
                Get.to(() => EditarDatosTienda(
                    entidad: widget.entidad, dir: widget.entidad.dir));
              },
              icon: const Icon(Icons.edit_outlined)),
          IconButton(
              key: const Key('ButtonHomeTiendaLogOff'),
              iconSize: 25,
              tooltip: 'Cerrar Sesion',
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        Stack(
          children: [buildProfileImage('assets/images/logo_tienda.png')],
        ),
        const Expanded(
          child: SizedBox(
            height: 20,
          ),
        ),
        Obx(
          () => Text(obteniendousername(users),
              style: const TextStyle(
                  fontSize: 40.0,
                  color: Color(0xFF00BE5D),
                  // letterSpacing: 2.0,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(73, 0, 73, 0),
          child: Obx(
            () => Text(
              obteniendouserdir(users),
              style: const TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF00BE5D),
                  // letterSpacing: 2.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(
            height: 80,
          ),
        ),
        SizedBox(
          width: 250,
          height: 50,
          child: OutlinedButton(
            key: const Key('ButtonEditTienda'),
            onPressed: () {
              Get.to(() => const BalanceT());
            },
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              elevation: 15.0,
              backgroundColor: const Color(0xFF00BE5D),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
            ),
            child: const Text(
              "Balance",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(
            height: 20,
          ),
        ),
        SizedBox(
          width: 250,
          height: 50,
          child: OutlinedButton(
            key: const Key('ButtonEditTienda'),
            onPressed: () {
              Get.to(() => TiendaListProduts(
                    key: const Key('ProductosTienda'),
                    entidad: widget.entidad,
                  ));
            },
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              elevation: 15.0,
              backgroundColor: const Color(0xFF00BE5D),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
            ),
            child: const Text(
              "Mis Productos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Expanded(
          child: SizedBox(
            height: 20,
          ),
        ),
      ])),
    );
  }

  Widget buildProfileImage(img) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const CustomBanner(180),
        SizedBox(
          height: 180,
          width: 180,
          child: CircleAvatar(
            backgroundImage: AssetImage(img),
            radius: 90.0,
          ),
        )
      ],
    );
  }
}
