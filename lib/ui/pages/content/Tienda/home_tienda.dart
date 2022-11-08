import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/ui/pages/content/Tienda/balance_tienda.dart';
import 'package:f_testing_template/ui/pages/content/Tienda/editar_datos_tienda.dart';
import 'package:f_testing_template/ui/pages/content/Tienda/tienda_list_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/entities/tienda_entidad.dart';
import '../../../widgets/banner.dart';

class HomePageTienda extends StatefulWidget {
  const HomePageTienda({Key? key}) : super(key: key);

  @override
  State<HomePageTienda> createState() => _HomePageTiendaState();
}

class _HomePageTiendaState extends State<HomePageTienda> {
  final AuthService _auth = AuthService();
  TiendaEnt entidad = TiendaEnt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Home"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              key: const Key('ButtonHomeTiendaEditar'),
              onPressed: () {
                Get.to(() => EditarDatosTienda(entidad: entidad));
              },
              icon: const Icon(Icons.edit_outlined)),
          IconButton(
              key: const Key('ButtonHomeTiendaLogOff'),
              onPressed: () async {
                await _auth.signOut();
                /* Get.off(() => LoginScreen(
                      key: const Key('LoginScreen'),
                    )); */
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Column(children: [
        Stack(
            // children: [buildProfileImage(widget.entidad.picture)],
            ),
        const SizedBox(
          height: 60,
        ),
        /* Text(widget.entidad.name,
            style: const TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 0, 0, 0),
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400)), */
        const SizedBox(
          height: 20,
        ),
        /* Text(
          widget.entidad.dir,
          style: const TextStyle(
              fontSize: 18.0,
              color: Color.fromARGB(255, 0, 0, 0),
              letterSpacing: 2.0,
              fontWeight: FontWeight.w400),
        ), */
        const SizedBox(
          height: 80,
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
              backgroundColor: Colors.teal,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            child: const Text("Balance"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 250,
          height: 50,
          child: OutlinedButton(
            key: const Key('ButtonEditTienda'),
            onPressed: () {
              Get.to(() => TiendaListProduts(
                    key: const Key('ProductosTienda'),
                    entidad: entidad,
                  ));
            },
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.teal,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            child: const Text("Mis Productos"),
          ),
        )
      ])),
    );
  }

  Widget buildProfileImage(img) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const CustomBanner(190),
        CircleAvatar(
          backgroundImage: NetworkImage(img),
          radius: 90.0,
        )
      ],
    );
  }
}
