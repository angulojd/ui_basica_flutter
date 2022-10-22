import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BalanceT extends StatefulWidget {
  const BalanceT({Key? key}) : super(key: key);

  @override
  State<BalanceT> createState() => BalanceState();
}

class BalanceState extends State<BalanceT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Productos Vendidos"), actions: <Widget>[
        IconButton(
            key: Key('deleteAllButton'),
            onPressed: () {
              //userController.deleteAll();
            },
            icon: Icon(Icons.delete))
      ]),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Dismissible(
              key: UniqueKey(),
              background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Deleting",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              onDismissed: (direction) {
                // Remove the item from the data source.
                //userController.deleteUser(user.id);
              },
              child: Column(
                children: [
                  Card(
                    // key: Key('tiendaItem$id'),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Papa",style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("20.2"),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Cantidad",style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: /* Obx(() => */
                                      Text("3")
                                  // )
                                  ),
                            ],
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Precio",style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: /* Obx(() => */
                                      Text("3")
                                  // )
                                  ),
                            ],
                          )
                        ]),
                  ),


                  Card(
                    // key: Key('tiendaItem$id'),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Yuca",style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("40.2"),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Cantidad",style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: /* Obx(() => */
                                      Text("5")
                                  // )
                                  ),
                            ],
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Precio",style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: /* Obx(() => */
                                      Text("5")
                                  // )
                                  ),
                            ],
                          )
                        ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
