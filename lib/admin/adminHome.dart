
import 'package:bms/admin/adminWidget/adminDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bms/pie_chart/categories_row.dart';
import 'package:bms/pie_chart/pie_chart_view.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/dot_bottom_bar.dart';
import 'package:flutter/material.dart';



class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
      drawer: AdminDrawer(),
      backgroundColor: Color.fromRGBO(193, 214, 223, 1),
      extendBody: true,
      // bottomNavigationBar: DotBotoomBar(),
      appBar: SearchBar(titile: 'Admin DashBoard',),
      body: SafeArea(
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
