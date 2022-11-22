// ignore_for_file: avoid_print

import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'dart:async';

class RealTimeDB extends GetxController {
  var _users = <TiendaEnt>[].obs;

  final databaseRef = FirebaseDatabase.instance.ref();

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;

  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  get allUsers => _users;

  // método para comenzar a escuchar cambios en la "tabla" userList de la base de datos
  void start() {
    _users.clear();
    newEntryStreamSubscription =
        databaseRef.child("userList").onChildAdded.listen(_onEntryAdded);

    updateEntryStreamSubscription =
        databaseRef.child("userList").onChildChanged.listen(_onEntryChanged);
  }

// cuando obtenemos un evento con un nuevo usuario lo agregamos a _users
  _onEntryAdded(DatabaseEvent event) {
    print('alo');
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _users.add(TiendaEnt.fromJson(event.snapshot, json));
  }

  // cuando obtenemos un evento con un usuario modificado lo reemplazamos en _users
  // usando el key como llave
  _onEntryChanged(DatabaseEvent event) {
    var oldEntry = _users.firstWhere((entry) {
      print('entry.${entry.id}');
      return entry.id == event.snapshot.key;
    });
    // print('$_users');
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    print(json);
    _users[_users.indexOf(oldEntry)] =
        TiendaEnt.fromJson(event.snapshot, json);
  }

  // método para actualizar un usuario
  Future<void> updateUser(nombre, uid) async {
    print("Updating user in realTime for uid: $uid");
    try {
      await databaseRef
          .child('userList')
          .child(uid)
          .update({'nombre': nombre});
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  // método para actualizar dir de un user
  Future<void> updateUserDir(dir, uid) async {
    print("Updating user Dir in realTime for uid: $uid");
    try {
      await databaseRef
          .child('userList')
          .child(uid)
          .update({'dir': dir});
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  // método para crear un nuevo usuario
  Future<void> createUser(email, uid, nombre, password, dir, type) async {
    print(
        "Creating user in realTime for $email and uid: $uid, name: $nombre, type: $type");
    try {
      // start();
      await databaseRef.child('userList').child(uid).set({
        'uid': uid,
        'nombre': nombre,
        'email': email,
        'password': password,
        'dir': dir,
        'type': type,
      });
    } catch (error) {
      print(error);
      return Future.error(error);
    }
  }

  // método para crear un nuevo producto
  Future<void> createProducto(nombre, tipo, peso, cantidad, precio, uid) async {
    print(
        "Creating product in realTime for uid: $uid, name: $nombre, type: $tipo");
    try {
      // start();
      final DatabaseReference reference = databaseRef.child('userList').child(uid).child('productList');
      DatabaseReference newRef = reference.push();
      String? newKey = newRef.key;

      await newRef.set({
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
