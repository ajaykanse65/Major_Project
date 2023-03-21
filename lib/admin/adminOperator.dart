

import 'package:bms/admin/addOperator.dart';
import 'package:bms/admin/adminWidget/adminDrawer.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

class AdminOperator extends StatefulWidget {
  const AdminOperator({Key? key}) : super(key: key);

  @override
  State<AdminOperator> createState() => _AdminOperatorState();
}

class _AdminOperatorState extends State<AdminOperator> {

  final Stream<QuerySnapshot> userStream = FirebaseFirestore.instance.collection('operator').snapshots();
  String productname ='', pname = '', gst = '', hsn = '', purchase = '', sale = '', opening = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 223, 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddOperator()));
        },
        elevation: 0,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(Icons.add),
        ),
        backgroundColor: Color(0xFF607894),
        foregroundColor: Colors.black,
      ),
      drawer: AdminDrawer(),
     appBar: SearchBar(titile: 'Operator'),
     body: SingleChildScrollView(
       scrollDirection: Axis.horizontal,
       child: Column(
         children: [
           table(context)
         ],
       ),
     ),
    );
  }

  Widget table(BuildContext context){
    return StreamBuilder<QuerySnapshot>(stream: userStream,
        builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            print('object');
          }if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          final List storedoc= [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data()as Map<String, dynamic>;
            storedoc.add(a);
          }).toList();
          return Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child:
            DataTable(columnSpacing: 12, horizontalMargin: 12, columns: [
              DataColumn(
                  label: Text(
                    "Cr No.",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
              DataColumn(
                  label: Text(
                    "Type",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
              DataColumn(
                  label: Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
              DataColumn(
                  label: Text(
                    "Mobile No",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
              DataColumn(
                  label: Text(
                    "Email Id",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
              DataColumn(
                  label: Text(
                    "Billing Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
              DataColumn(
                  label: Text(
                    "City",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
              DataColumn(
                  label: Text(
                    "Status",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
              DataColumn(
                  label: Text(
                    "Action",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
            ],
                rows: <DataRow>[
                  for (var i = 0; i < storedoc.length; i++)...[
              DataRow(cells: <DataCell>[
                DataCell(Text("${i+1}")),
                DataCell(Text(storedoc[i]['utype'])),
                DataCell(Text(storedoc[i]['fname'])),
                DataCell(Text(storedoc[i]['phone'])),
                DataCell(Text(storedoc[i]['email'])),
                DataCell(Text(storedoc[i]['billing'])),
                DataCell(Text(storedoc[i]['city'])),
                DataCell(Text(storedoc[i]['onu'])),
                DataCell(Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                          },
                          icon: Icon(Icons.print, color: Colors.black)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit, color: Colors.green)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: Colors.red)),
                    ],
                  ),
                )
          ),
              ]),
            ]],
            ),
          );
        });
  }
}
