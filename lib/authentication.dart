
import 'package:bms/customWidget/customSnackBarContent.dart';
import 'package:bms/service/usermanagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  final _fireStore = FirebaseFirestore.instance;

  //SIGN UP METHOD
  Future signUp(
      {required String email,
      required String password,
      required String role}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _fireStore
          .collection('collectionPath')
          .doc(user!.uid)
          .set({'id': user.uid, 'uname': email, 'role': role});
      return null;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  //SIGN IN METHOD
  Future<void> signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: CustomSuccessContent(),
        behavior: SnackBarBehavior.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ));
      await Future.delayed(const Duration(milliseconds: 3000));
      UserManagemnt().authorizeAccess(context);

    } on FirebaseAuthException catch (e) {
      if(e.code == 'invalid-email'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: CustomSnackBarContent(errorText: 'You have entered an invalid username or password',),
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ));
      }else if(e.code == 'wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: CustomSnackBarContent(errorText: 'You have entered an invalid username or password',),
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ));
      }else if(e.code == 'unknown'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: CustomSnackBarContent(errorText: 'Please enter the username and password or This field can not be empty',),
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ));
      }
    }
  }
  //invalid-email
  //wrong-password
  //unknown

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();

    print('signout');
  }
}
