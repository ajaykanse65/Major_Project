

import 'dart:convert';

import 'package:bms/admin/adminHome.dart';
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
          return AdminHome();
        }
        return LoginPage2();
        }
    );
  }



  authorizeAccess(BuildContext context)async{
    DocumentSnapshot test = await FirebaseFirestore.instance.collection('collectionPath')
        .doc(user!.uid)
        .get();
    var test2 = test.get('role') as String;
    var test3 = test.get('uname') as String;
    print(test3.toString());
    if(test2 == 'Admin'){
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminHome()));
    }else if(test2 == 'Operator'){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  OperatorHome()));
    }

  }
  signOut(){
    FirebaseAuth.instance.signOut();
  }
}


