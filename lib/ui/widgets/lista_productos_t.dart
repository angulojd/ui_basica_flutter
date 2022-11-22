import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/productodb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListaProductosT extends StatefulWidget {
  const ListaProductosT({Key? key, required this.producto}) : super(key: key);

  final ProductoEnt producto;

  @override
  State<ListaProductosT> createState() => _ListaProductosTState();
}

class _ListaProductosTState extends State<ListaProductosT> {
  ProductoDB productController = Get.find();
  AuthService auth = AuthService();
  get products => productController.allproducts();

  ProductoEnt obteniendoproduct(products) {
    return products.firstWhere((p) => p.id == widget.producto.id);
    // return products.firstWhere((element) => element.dueno == widget.entidad.id);
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: RichText(
              text: const TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.warning, size: 40, color: Colors.red,),
                  ),
                  TextSpan(
                    text: " Atención!!",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 40
                    )
                  ),
                ],
              ),
            ),
            content: const Text("No puedes bajar más de 0 la cantidad"),
            actions: <Widget>[
              ElevatedButton(
                child: const Text(
                  "CERRAR",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    String id = widget.producto.id;
    return Center(
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Borrando!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            )),
        onDismissed: (direction) {
          // Remove the item from the data source.
          productController.deleteproductsuser(widget.producto.id);
        },
        child: Card(
          elevation: 6,
          color: const Color(0xFF00BE5D),
          key: Key('tiendaItem$id'),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(
              widget.producto.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Peso",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.producto.peso,
                      style: const TextStyle(fontSize: 15),
                    )),
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Precio",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.producto.precio,
                      style: const TextStyle(fontSize: 15),
                    )),
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () => {
                          productController.updatecantidad(widget.producto.id,
                              obteniendoproduct(products).cantidad)
                        },
                    icon: const Icon(
                      Icons.arrow_upward,
                      size: 26,
                    )),
                IconButton(
                    onPressed: () => {
                          if (obteniendoproduct(products).cantidad != '0')
                            {
                              productController.downdatecantidad(
                                  widget.producto.id,
                                  obteniendoproduct(products).cantidad)
                              /* controller.downdatecantidad(index) */
                            }
                          else
                            {_showAlertDialog()}
                        },
                    icon: const Icon(
                      Icons.arrow_downward,
                      size: 26,
                    ))
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Cantidad",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() => Text(
                          obteniendoproduct(products).cantidad,
                          style: const TextStyle(fontSize: 15),
                        ))),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
