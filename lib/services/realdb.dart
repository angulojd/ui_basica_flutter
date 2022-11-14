// ignore_for_file: avoid_print

import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'dart:async';


class RealTimeDB extends GetxController{
  var _users = <TiendaEnt>[].obs;
  final databaseRef = FirebaseDatabase.instance.ref();
  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;


  get allUsers => _users;

  void start() {
    print("escuchando");
    newEntryStreamSubscription =
        databaseRef.child("userList").onChildAdded.listen(_onEntryAdded);
  }

  _onEntryAdded(DatabaseEvent event) {
    print('entro al onentry');
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _users.add(TiendaEnt.fromJson(event.snapshot, json));
  }


  Future<void> createUser(email, uid, nombre, password, dir, type) async {
    print("Creating user in realTime for $email and uid: $uid, name: $nombre, type: $type");
    try {
      // start();
      await databaseRef
          .child('userList')
          .child(uid)
          .set({
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
  
}