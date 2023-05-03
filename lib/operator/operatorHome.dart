import 'package:animated_emoji/animated_emoji.dart';
import 'package:bms/admin/adminHome.dart';
import 'package:bms/admin/adminOperator.dart';
import 'package:bms/customWidget/bottombar.dart';
import 'package:bms/listtest.dart';
import 'package:bms/operator/OperatorWidget/operatorDrawer.dart';
import 'package:bms/operator/operatorNetwork.dart';
import 'package:bms/operator/operatorUser.dart';
import 'package:bms/operator/topup.dart';
import 'package:bms/pie_chart/categories_row.dart';
import 'package:bms/pie_chart/pie_chart_view.dart';
import 'package:bms/widget/dot_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widget/custom_search_widget.dart';


class OperatorHome extends StatefulWidget {
  const OperatorHome({Key? key}) : super(key: key);

  @override
  State<OperatorHome> createState() => _OperatorHomeState();
}

class _OperatorHomeState extends State<OperatorHome> with SingleTickerProviderStateMixin{
  bool isEmailVerified = false;
  Animation<double>? _animation;
  AnimationController? _animationController;
  var chcecktoday;
  @override
  void initState() {
    getUid();
    chcecktoday = DateFormat.yMd().format(now);
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified){
      sendVerificationEmail();
    }

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    getData();
    super.initState();
  }
  Future sendVerificationEmail() async{
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e){
      print(e.toString());
    }
  }
  String count ='';
  String? userId;
  Future<void> getUid() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    setState(() {
      userId = currentUser!.uid;
    });
  }

  final List<ChartData> chartData = [
    ChartData('Total Operator', 25, Color.fromRGBO(9,0,136,1)),
    ChartData('Active Operator', 38, Color.fromRGBO(147,0,119,1)),
    ChartData('Pending Operator', 34, Color.fromRGBO(228,0,124,1)),
    ChartData('Approved Operator', 52, Color.fromRGBO(255,189,57,1)),
    ChartData('Deactivated Operator', 52, Color.fromRGBO(255,189,57,1)),
  ];
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BotoomBar(selectedIndex: 0,),
      backgroundColor: Color.fromRGBO(193, 214, 223, 1),
      extendBody: true,
      // bottomNavigationBar: DotBotoomBar(),
      appBar: SearchBar(titile: 'Operator DashBoard',),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 339,
            color: Color.fromRGBO(193, 214, 223, 1),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              ),
              color: Color(0xFF8e9fb3),
              elevation: 80,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,),
                    child: Text('User Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total User',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                            Text('Active User',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                            Text('Pending User',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                            Text('Approved User',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                            Text('Deactivated User',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SfCircularChart(
                            series: <CircularSeries>[
                              RadialBarSeries<ChartData, String>(
                                  radius: "80%",
                                  dataSource: chartData,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  trackBorderColor: Colors.black,
                                  // Corner style of doughnut segment
                                  dataLabelSettings: DataLabelSettings(
                                      textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12),
                                      borderRadius: 1,
                                      borderColor: Colors.white,
                                      // Renders the data label
                                      isVisible: true
                                  )

                                // explode: true,
                                // groupMode: CircularChartGroupMode.point,
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('collectionPath').doc(userId).collection('UserCollection').where('duedate', isEqualTo: chcecktoday).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.data!.docs.isEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Expired user not found...',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                      AnimatedEmoji(AnimatedEmojis.sad,repeat: true,),
                    ],
                  );
                }

                return ListView(
                  children: snapshot.data!.docs.map((doc) =>
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                        child: ListTile(
                          style: ListTileTheme.of(context).style,
                          selectedTileColor: Color(0xFF8e9fb3),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.5),
                              borderRadius: BorderRadius.circular(25)),
                          leading: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.black,
                          ),
                          title: Text('Name: ${doc['billingName']}',
                            style: TextStyle(
                                letterSpacing: 1,
                                height: 1.2,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            'Contact No: ${doc['mobileNo']}\nAmount: ${doc['planPrice']}',
                            style: TextStyle(
                                letterSpacing: 1,
                                height: 1.2,
                                color: Colors.black),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: () {
                                FlutterPhoneDirectCaller.callNumber("+91 ${doc['mobileNo']}");
                              }, icon: const Icon(Icons.call,size: 20,)),
                              // IconButton(onPressed: () {
                              //   // showDialog(context: context, builder: (BuildContext context) =>
                              //   //     update(id: '${doc.id}')
                              //   // );
                              //
                              // }, icon: const Icon(Icons.edit,size: 20)),
                              // IconButton(onPressed: () {
                              //       deleteUser(id: '${doc.id}');
                              //
                              //
                              // }, icon: const Icon(Icons.delete,size: 20)),
                            ],
                          ),
                        ),
                      )
                  ).toList(),
                );
              },
            ),
          )

          //   PieChart(
          // dataMap: {
          //   "${DayUse} Days Use": DayUse.toDouble(),
          //   "${DayLeft} Days Left": DayLeft.toDouble(),
          // },
          // colorList: colorList,
          // chartRadius: 100,
          // centerText: "Days Limit",
          // chartType: ChartType.ring,
          // ringStrokeWidth: 24,
          // animationDuration: Duration(seconds: 1),
          // chartValuesOptions: ChartValuesOptions(showChartValues: false),
          // legendOptions: const LegendOptions(
          //   showLegendsInRow: true,
          //   showLegends: true,
          //   legendShape: BoxShape.rectangle,
          //   // legendPosition: LegendPosition.bottom,
          //   legendTextStyle: TextStyle(
          //       fontSize: 12,
          //       fontWeight: FontWeight.bold),
          // ),)
        ],
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
