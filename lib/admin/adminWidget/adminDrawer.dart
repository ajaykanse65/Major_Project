

import 'package:bms/admin/adminHome.dart';
import 'package:bms/admin/adminNetwrok.dart';
import 'package:bms/admin/adminOperator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  String uname ='';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;



  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(accountEmail: Text(uname), accountName: Text(uname),

          ),
          Container(
            child: Column(
              children: [
                ListTile(
                  title: Text('DashBoard'),
                  leading: Icon(Icons.home),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome()));
                  },
                ),
                ListTile(
                  title: Text('Operator'),
                  leading: Icon(Icons.person),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminOperator()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.network_check),
                  title: Text('Network'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminNetwork()));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


   getData()async{
    var email = await _auth.currentUser!.email.toString();
    setState(() {
      uname = email;
    });
    print(email);
    // DocumentSnapshot data = await FirebaseFirestore.instance.collection('collectionPath')
    //     .doc(user.uid)
    //     .get();
    // var dataemail = data.get('uname') as String;
    // setState(() {
    //   uname = dataemail;
    // });

        
  }
}

