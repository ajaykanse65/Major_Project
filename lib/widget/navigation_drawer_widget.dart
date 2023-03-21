import 'dart:convert';

import 'package:bms/Utils/colors.dart';
import 'package:bms/page/bank.dart';
import 'package:bms/page/cm_invoice.dart';
import 'package:bms/page/customer.dart';
import 'package:bms/page/employee.dart';
import 'package:bms/page/expense.dart';
import 'package:bms/page/gst_report.dart';
import 'package:bms/page/home.dart';
import 'package:bms/page/invoice.dart';
import 'package:bms/page/isp_invoice.dart';
import 'package:bms/page/network.dart';
import 'package:bms/page/new_sale.dart';
import 'package:bms/page/new_user.dart';
import 'package:bms/page/onusers.dart';
import 'package:bms/page/plans.dart';
import 'package:bms/page/product.dart';
import 'package:bms/page/purchase.dart';
import 'package:bms/page/quotation.dart';
import 'package:bms/page/receipts.dart';
import 'package:bms/page/renewal.dart';
import 'package:bms/page/report.dart';
import 'package:bms/page/task_manager.dart';
import 'package:bms/page/utilization.dart';
import 'package:bms/page/vendor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../page/topup.dart';
class MultilevelDrawerWidget extends StatefulWidget {
  const MultilevelDrawerWidget({Key? key}) : super(key: key);

  @override
  State<MultilevelDrawerWidget> createState() => _MultilevelDrawerWidgetState();
}

class _MultilevelDrawerWidgetState extends State<MultilevelDrawerWidget> {
  List data =[];
  final _fireStore = FirebaseFirestore.instance;
  String email = 'test@gmail.com';


  late SharedPreferences preferences;
  @override
  void initState(){
    super.initState();
    // sharedData();
    getdata();
  }

  getdata() async{
    DocumentSnapshot test = await _fireStore.collection('testing').doc('5A2Zm570SeNCj5nZNiCP').get();
    var test2 = test.get('menu') as List;
    setState(() {
      data = test2;
    });

      print(test.get('menu'));

  }
  void sharedData() async{
    preferences = await SharedPreferences.getInstance();
    var list = preferences.getString('menulist') as String;
    var menulist =jsonDecode(list) as List;
    setState(() {
      data = menulist;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFF8e9fb3),
        // color: Colors.white,
        // decoration:
        // const BoxDecoration(gradient: LinearGradient(colors: cardcolor)),
        width: 200,
        child: Column(
            children:  [
              // StreamBuilder(
              //     builder:
              // ),
              const DrawerHeader(
                decoration:
                BoxDecoration(
                  color: Color(0xFF778ba3)
                ),
                child: Center(
                  child: Text(
                    "Bits \nManagement \nSystem",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child:
                 ListView(
                  children: data.map((menu) {
                    return ListTile(
                      title: Text(menu,style:const TextStyle(fontWeight: FontWeight.bold),),
                      onTap: (){
                        if(menu == 'network'){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Network()));
                        }else if(menu == "Top-Up"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => topup()));
                        }else if(menu == "Dashboard"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const home()));
                        }else if(menu == "New Sale"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => new_sale()));
                        }else if(menu == "Utilization"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => uitilizationn()));
                        }else if(menu == "Quotation"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => quotation()));
                        }else if(menu == "Purchase"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => purchase()));
                        }else if(menu == "Expense"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => expense()));
                        }else if(menu == "Bank"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const bank()));
                        }else if(menu == "New User"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const new_user()));
                        }else if(menu == "Task Manager"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const TaskManager()));
                        }else if(menu == "User Info."){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const renewal()));
                        }else if(menu == "Online User"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => on_users()));
                        }else if(menu == "Customer"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => customer()));
                        }else if(menu == "Vendor"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => vendor()));
                        }else if(menu == "Product/Service"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Product1()));
                        }else if(menu == "Plans"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => plans()));
                        }else if(menu == "Invoice"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => invoice()));
                        }else if(menu == "ISP Invoice"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => isp_invoice()));
                        }else if(menu == "Commission Invoice"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const cm_invoice()));
                        }else if(menu == "Receipts"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => receipts()));
                        }else if(menu == "Employee"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => emp()));
                        }else if(menu == "Report"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const report()));
                        }else if(menu == "GST Report"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => gst_report()));
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
      )
    );
  }
}

