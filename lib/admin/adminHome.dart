
import 'package:animated_emoji/animated_emoji.dart';
import 'package:bms/admin/adminNetwrok.dart';
import 'package:bms/admin/adminOperator.dart';
import 'package:bms/admin/adminWidget/adminDrawer.dart';
import 'package:bms/admin/adminbottomdot.dart';
import 'package:bms/admin/payment.dart';
import 'package:bms/listtest.dart';
import 'package:bms/neumorphic_pie/neumorphic_pie.dart';
import 'package:bms/pie_chart/categories_row.dart';
import 'package:bms/pie_chart/pie_chart_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/dot_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:bms/pie_chart/piem_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';





class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> with SingleTickerProviderStateMixin {
  bool isEmailVerified = false;
  Animation<double>? _animation;
  AnimationController? _animationController;
  @override
  void initState() {

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
  TextEditingController desccontroller = TextEditingController();
  CollectionReference opCollection = FirebaseFirestore.instance.collection('opResponse');

  final List<ChartData> chartData = [
    ChartData('Total Operator', 25, Color.fromRGBO(9,0,136,1)),
    ChartData('Active Operator', 38, Color.fromRGBO(147,0,119,1)),
    ChartData('Pending Operator', 34, Color.fromRGBO(228,0,124,1)),
    ChartData('Approved Operator', 52, Color.fromRGBO(255,189,57,1)),
    ChartData('Deactivated Operator', 52, Color.fromRGBO(255,189,57,1)),
  ];
  String count ='';
  String updateDropdownvalue = 'Out off area';
  var itemsUpdate = ['Out off area','Not Interested','Application Confirmed','Rejected'];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // floatingActionButton: FloatingActionBubble(
      //   items: <Bubble>[
      //     Bubble(
      //         icon: Icons.home,
      //         iconColor: Colors.black,
      //         title: 'DashBoard',
      //         titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
      //         bubbleColor:   Color.fromRGBO(82, 98, 255, 1),
      //         onPress: () {
      //           _animationController!.reverse();
      //           Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome()));
      //         }),
      //     Bubble(
      //         icon: Icons.person,
      //         iconColor: Colors.black,
      //         title: 'Operator',
      //         titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
      //         bubbleColor: Color.fromRGBO(255, 171, 67, 1),
      //         onPress: () {
      //           _animationController!.reverse();
      //           Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminOperator()));
      //         }),
      //     Bubble(
      //         icon: Icons.network_check,
      //         iconColor: Colors.black,
      //         title: 'Network',
      //         titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
      //         bubbleColor: Color.fromRGBO(46, 198, 255, 1),
      //         onPress: () {
      //           _animationController!.reverse();
      //           Navigator.push(context, MaterialPageRoute(builder: (context) => AdminNetwork()));
      //         }),
      //     Bubble(
      //         icon: Icons.payment,
      //         iconColor: Colors.black,
      //         title: 'Payment',
      //         titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
      //         bubbleColor: Color.fromRGBO(46, 198, 255, 1),
      //         onPress: () {
      //           _animationController!.reverse();
      //           Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePayment()));
      //         }),
      //   ],
      //
      //   animation: _animation!,
      //   onPress: () => _animationController!.isCompleted
      //       ? _animationController!.reverse()
      //       : _animationController!.forward(),
      //   backGroundColor: Theme.of(context).primaryColor,
      //   iconColor: Colors.white,
      //   iconData: Icons.menu,
      // ),
      bottomNavigationBar: AdminBottomDot(selectedIndex: 0),
      backgroundColor: Color.fromRGBO(193, 214, 223, 1),
      extendBody: true,
      // bottomNavigationBar: DotBotoomBar(),
      appBar: SearchBar(titile: 'Admin DashBoard',),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                        child: Text('Operator Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total Operator',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                Text('Active Operator',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                Text('Pending Operator',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                Text('Approved Operator',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                Text('Deactivated Operator',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SfCircularChart(
                                series: <CircularSeries>[
                                  RadialBarSeries<ChartData, String>(
                                    radius: "100%",
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
                  stream: FirebaseFirestore.instance.collection('opResponse').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.data!.docs.isEmpty) {
                      return Text('No items found.');
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
                              title: Text('Name: ${doc['fname']}',
                                style: TextStyle(
                                    letterSpacing: 1,
                                    height: 1.2,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                'Contact No: ${doc['contactno']}\nLocation: ${doc['areaname']}',
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
                                    FlutterPhoneDirectCaller.callNumber("+91 ${doc['contactno']}");
                                  }, icon: const Icon(Icons.call,size: 20,)),
                                  IconButton(onPressed: () {
                                    showDialog(context: context, builder: (BuildContext context) =>
                                        update(id: '${doc.id}')
                                    );

                                  }, icon: const Icon(Icons.edit,size: 20)),
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
          )

    );
  }
  deleteUser({required String id}){
    return opCollection
        .doc(id)
        .delete()
        .catchError((e) => debugPrint(e));
  }
  getData() async{
    QuerySnapshot data = await FirebaseFirestore.instance.collection('collectionPath').get();
    var get = data.docs;
    var last = get.length.toString();
    setState(() {
      count = last;
    });
  }

  Widget update({required String id}){
    return AlertDialog(
      title: const Text("Update Status",style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      content: Card(
        elevation: 20,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border:Border.all(width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Stack(
            clipBehavior: Clip.none, children: <Widget>[
            Positioned(
              right: -54.0,
              top: -92.0,
              child: InkResponse(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const CircleAvatar(
                  child: Icon(Icons.close),
                  backgroundColor: Color(0xFF11253d),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Status:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0,top: 4.0),
                      //   child: Container(
                      //     height: 60,
                      //     decoration: BoxDecoration(
                      //         color: Colors.grey[200],
                      //         borderRadius: BorderRadius.circular(8)
                      //     ),
                      //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      //     child: TextFormField(
                      //       controller: desccontroller,
                      //       maxLines: 3,
                      //       minLines: 2,
                      //       style: const TextStyle(color: Colors.grey),
                      //       validator: (value) {
                      //         if (value!.isEmpty) {
                      //           return 'Enter a First Name!';
                      //         }
                      //         return null;
                      //       },
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0,top: 4.0),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: DropdownButtonFormField(
                            value: updateDropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                            items: itemsUpdate.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(items,style: const TextStyle(color: Colors.black),),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                updateDropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(onTap: (){Navigator.pop(context);Fluttertoast.showToast(msg: 'Update Cancel...😕');},
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                child: const Text('Cancel',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),)),),
                          InkWell(onTap: () async{
                            Navigator.of(context);
                            FirebaseFirestore.instance.collection('opResponse')
                                .doc(id)
                                .update({
                              'status': updateDropdownvalue.toString(),
                                });

                            Fluttertoast.showToast(msg: 'Status updated successfully...👍🏻');

                          },
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                decoration: const BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                child: const Text('Submit',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),)),)

                        ],
                      )
                    ],
                  )


              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y;
  final Color color;
  ChartData(this.x, this.y, this.color);
}