// ignore_for_file: avoid_print

import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'dart:async';

class ProductoDB extends GetxController {
  var _productos = <ProductoEnt>[].obs;

  final databaseRef = FirebaseDatabase.instance.ref();

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;

  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  get allproducts => _productos;

  // método para comenzar a escuchar cambios en la "tabla" userList de la base de datos
  void start() {
    _productos.clear();
    newEntryStreamSubscription =
        databaseRef.child("productList").onChildAdded.listen(_onEntryAdded);

    updateEntryStreamSubscription =
        databaseRef.child("productList").onChildChanged.listen(_onEntryChanged);
  }

// cuando obtenemos un evento con un nuevo producto lo agregamos a _products
  _onEntryAdded(DatabaseEvent event) {
    print('ala');
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _productos.add(ProductoEnt.fromJson(event.snapshot, json));
  }

  // cuando obtenemos un evento con un producto modificado lo reemplazamos en _products
  // usando el key como llave
  _onEntryChanged(DatabaseEvent event) {
    var oldEntry = _productos.firstWhere((entry) {
      print('entry.${entry.id}');
      return entry.id == event.snapshot.key;
    });
    // print('$_users');
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    print(json);
    _productos[_productos.indexOf(oldEntry)] =
        ProductoEnt.fromJson(event.snapshot, json);
  }

  // método para actualizar un producto
  Future<void> updateUser(nombre, dir, uid) async {
    print("Updating user in realTime for uid: $uid");
    try {
      await databaseRef
          .child('userList')
          .child(uid)
          .update({'nombre': nombre, 'dir': dir});
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  //método para subir cantidad producto
  Future<void> updatecantidad(String pid, String cantidad) async {
    print("Updating product in realTime for pid: $pid");
    int aux = int.parse(cantidad);
    try {
      await databaseRef
          .child('productList')
          .child(pid)
          .update({'cantidad': '${aux+1}'});
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  //método para bajar cantidad producto
  Future<void> downdatecantidad(String pid, String cantidad) async {
    print("Updating product in realTime for pid: $pid");
    int aux = int.parse(cantidad);
    if (aux != 0) {
      try {
      await databaseRef
          .child('productList')
          .child(pid)
          .update({'cantidad': '${aux-1}'});
    } catch (error) {
      print(error);
      return Future.error(error);
    }
    } else {
      print('no se puede bajar la cantidad');
    }
  }

  // método para crear un nuevo producto
  Future<void> createProducto(nombre, tipo, peso, cantidad, precio, uid) async {
    print(
        "Creating product in realTime for uid: $uid, name: $nombre, type: $tipo");
    try {
      // start();
      final DatabaseReference reference = databaseRef.child('productList');
      DatabaseReference newRef = reference.push();
      String? newKey = newRef.key;

      await newRef.set({
        'dueno': uid,
        'pid': newKey,
        'nombre': nombre,
        'tipo': tipo,
        'peso': peso,
        'cantidad': cantidad,
        'precio': precio
      });
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }
}
