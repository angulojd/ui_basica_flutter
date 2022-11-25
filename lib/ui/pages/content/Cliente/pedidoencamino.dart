import 'package:f_testing_template/ui/pages/content/Cliente/vista_categorias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OnitsWay extends StatefulWidget {
  const OnitsWay({super.key});

  @override
  State<OnitsWay> createState() => _OnitsWayState();
}

class _OnitsWayState extends State<OnitsWay> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Text("¡GRACIAS POR TU COMPRA!"),
          const Text(
              "Hemos preparado la orden y las tiendas estan preparando tu pedido, porfa, dejanos saber como te fue"),
          Image.asset("assets/images/encamino.png"),
        ],
      )),
      bottomNavigationBar: BottomAppBar(
          child: ElevatedButton(
        onPressed: () {
          abrirdialogo();
        },
        child: const Text("¡Ya LLego!"),
      )),
    );
  }

  void abrirdialogo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Que te parecio la App"),
        content: Column(
          children: [
            const Text("Por favor danos un puntaje"),
            const SizedBox(height: 32),
            buildRating()
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const CategoryViewPage();
                    },
                  ),
                );
              },
              child: const Text("OK"))
        ],
      ),
    );
  }

  Widget buildRating() => RatingBar.builder(
      minRating: 1,
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: (rating) => setState(() {
            this.rating = rating;
          }));
}
