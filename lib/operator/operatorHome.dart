import 'package:bms/operator/OperatorWidget/operatorDrawer.dart';
import 'package:bms/pie_chart/categories_row.dart';
import 'package:bms/pie_chart/pie_chart_view.dart';
import 'package:bms/widget/dot_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/custom_search_widget.dart';


class OperatorHome extends StatefulWidget {
  const OperatorHome({Key? key}) : super(key: key);

  @override
  State<OperatorHome> createState() => _OperatorHomeState();
}

class _OperatorHomeState extends State<OperatorHome> {

  @override
  void initState() {
    getData();
    super.initState();
  }
  String count ='';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: OperatorDrawer(),
      backgroundColor: Color.fromRGBO(193, 214, 223, 1),
      extendBody: true,
      // bottomNavigationBar: DotBotoomBar(),
      appBar: SearchBar(titile: 'Operator DashBoard',),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height:  height * 0.43,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("User Details",style: GoogleFonts.rubik(fontWeight: FontWeight.w400,fontSize: 18),),
                      Expanded(child: Row(
                        children: [
                          CategoriesRow(),
                          PieChartView(count: count,),
                        ],
                      ),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  getData() async{
    QuerySnapshot data = await FirebaseFirestore.instance.collection('operator').get();
    var get = data.docs;
    var last = get.length.toString();
    setState(() {
      count = last;
    });
  }

}
