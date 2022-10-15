import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/entities/tienda_entidad.dart';
import '../../authentication/login.dart';
import '../../../widgets/banner.dart';


class HomePageTienda extends StatefulWidget {
  const HomePageTienda(
      {Key? key, required this.entidad})
      : super(key: key);

  final TiendaEnt entidad;

  @override
  State<HomePageTienda> createState() => _HomePageTiendaState();
}

class _HomePageTiendaState extends State<HomePageTienda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text("Home"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              key: const Key('ButtonHomeLogOff'),
              onPressed: () {
                Get.off(() => LoginScreen(
                      key: const Key('LoginScreen'),
                      entidad: widget.entidad,
                    ));
              },
              icon: const Icon(Icons.logout))
        ],
      ),

      body: Center(
        child: Column(
        children: [
          Stack(
            children: [buildProfileImage(widget.entidad.picture)],
          ),
          const SizedBox(
            height: 60,
          ),
          const Text("Arnaldo Benavides",
            style: TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 255, 255, 255),
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400)),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Barranquilla, Colombia",
            style: TextStyle(
              fontSize: 18.0,
              color: Color.fromARGB(255, 255, 255, 255),
              letterSpacing: 2.0,
              fontWeight: FontWeight.w300),
          ),
        ]
      )
      ),
    );
  }

    Widget buildProfileImage(img) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children:  [
         const CustomBanner(190),
        CircleAvatar(
          backgroundImage:
              NetworkImage(img),
          radius: 90.0,
        )
      ],
    );
  }
}