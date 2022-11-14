// ignore_for_file: avoid_print

import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //auth change user stream
  Stream<TiendaEnt?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //Create a user obj base on firebaseuser
  TiendaEnt? _userFromFirebaseUser(User? user) {
    if (user == null) {
      print("retornó null");
      return null;
    } else {
      print(user.uid);
      TiendaEnt aux = TiendaEnt(id: user.uid);
      return aux;
    }
  }

  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register in with email & password
  Future registerWithEmailAndPassword(String nombre, String email,
      String password, String dir, String type) async {
    RealTimeDB dbController = Get.find();

    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.signOut();
      await dbController.createUser(
          email, result.user!.uid, nombre, password, dir, type);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sing out
  Future signOut() async {
    try {
      print("saliendo");
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  String userEmail() {
    String email = _auth.currentUser!.email ?? 'def@def.com';
    return email;
  }

  String getUid() {
    String uid = _auth.currentUser!.uid;
    return uid;
  }
}
