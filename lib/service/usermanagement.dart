

import 'package:bms/admin/adminHome.dart';
import 'package:bms/customWidget/customSnackBarContent.dart';
import 'package:bms/login.dart';
import 'package:bms/operator/operatorHome.dart';
import 'package:bms/page/home.dart';
import 'package:bms/page/new_sale.dart';
import 'package:bms/page/topup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserManagemnt{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  Widget handleAuth(){
    return new StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot){
        if(snapshot.hasData){
          return const AdminHome();
        }
        return const LoginPage2();
        }
    );
  }



  authorizeAccess(BuildContext context)async{
    var test = await FirebaseFirestore.instance.collection('collectionPath')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
          if(documentSnapshot.exists){
            if(documentSnapshot.get('role') == 'Operator' && documentSnapshot.get('status') == 'Approved'){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: CustomSuccessContent(),
                behavior: SnackBarBehavior.fixed,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ));
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OperatorHome()));
            }else if(documentSnapshot.get('role') == 'Admin' && documentSnapshot.get('status') == 'Approved'){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: CustomSuccessContent(),
                behavior: SnackBarBehavior.fixed,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ));
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdminHome()));
            }else{
              ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                content: CustomSnackBarContent(errorText: 'Sorry...! Your Id is not Approved yet😟',),
                behavior: SnackBarBehavior.floating,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ));
              signOut();
          }
          }
    });

  }
  signOut(){
    FirebaseAuth.instance.signOut();
  }
}


