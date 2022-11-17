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
        title: const Text("Home"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              key: const Key('ButtonHomeTiendaEditar'),
              onPressed: () {
                Get.to(() => EditarDatosTienda(entidad: widget.entidad));
              },
              icon: const Icon(Icons.edit_outlined)),
          IconButton(
              key: const Key('ButtonHomeTiendaLogOff'),
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: Column(children: [
        Stack(
          children: [
            buildProfileImage(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Sortavala_market_place.jpg/220px-Sortavala_market_place.jpg")
          ],
        ),
        const Expanded(
          child: SizedBox(
            height: 20,
          ),
        ),
        Obx(
          () => Text(obteniendousername(users),
              style: const TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400)),
        ),
        const Expanded(
          child: SizedBox(
            height: 20,
          ),
        ),
        Obx(
          () => Text(
            obteniendouserdir(users),
            style: const TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 0, 0, 0),
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400),
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
              backgroundColor: Colors.teal,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            child: const Text("Balance"),
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
              backgroundColor: Colors.teal,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            child: const Text("Mis Productos"),
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
        const CustomBanner(150),
        SizedBox(
          height: 150,
          width: 150,
          child: CircleAvatar(
            backgroundImage: NetworkImage(img),
            radius: 90.0,
          ),
        )
      ],
    );
  }
}
