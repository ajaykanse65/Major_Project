

import 'package:bms/admin/adminHome.dart';
import 'package:bms/operator/operatorHome.dart';
import 'package:bms/page/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  final _fireStore = FirebaseFirestore.instance;

  //SIGN UP METHOD
  Future signUp({required String email, required String password, required String role}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _fireStore.collection('collectionPath').doc('loginDetails').set({
        'id' : user.uid,
        'uname' : email,
        'role' : role
      });
      return null;
    } on FirebaseAuthException catch (e) {
      print( e.message);
    }
  }




  //SIGN IN METHOD
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);


    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();

    print('signout');
  }
}