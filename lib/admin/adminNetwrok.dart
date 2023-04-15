import 'dart:convert';

import 'package:bms/Utils/loading_dialog.dart';
import 'package:bms/admin/adminHome.dart';
import 'package:bms/admin/adminOperator.dart';
import 'package:bms/admin/model/plandetails.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminNetwork extends StatefulWidget {
  const AdminNetwork({Key? key}) : super(key: key);

  @override
  State<AdminNetwork> createState() => _AdminNetworkState();
}

class _AdminNetworkState extends State<AdminNetwork>
    with SingleTickerProviderStateMixin {
  final List<Map> _network = [
    {
      'networkname': 'Test Network Agent',
      'users': '3',
      'topup': '4,035',
      'dueamt': '10,300',
      'rperson': 'prasad',
      'contact': '9223351536',
      'address': '1548 bmc, 6, malad w',
      'PAN': 'test212234r',
      'gstn': '27test21234r',
    },
    {
      'networkname': 'Test Network Agent',
      'users': '3',
      'topup': '4,035',
      'dueamt': '10,300',
      'rperson': 'prasad',
      'contact': '9223351536',
      'address': '1548 bmc, 6, malad w',
      'PAN': 'test212234r',
      'gstn': '27test21234r',
    },
  ];
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
    super.initState();
  }

  var dropdownvalue = '40 Mbps';
  var items = [
    '40 Mbps',
    '100 Mbps',
    '200 Mbps',
    '300 Mbps',
  ];
  TextEditingController planName = TextEditingController();
  TextEditingController planPrice = TextEditingController();
  TextEditingController commissionPrice = TextEditingController();
  final _planformkey = GlobalKey<FormState>();
  CollectionReference addplan = FirebaseFirestore.instance.collection('planDetails');
  final Stream<QuerySnapshot> planDetails = FirebaseFirestore.instance.collection('planDetails').snapshots();





  @override
  void dispose() {
    planName.dispose();
    planPrice.dispose();
    commissionPrice.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
              icon: Icons.home,
              iconColor: Colors.black,
              title: 'DashBoard',
              titleStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
              bubbleColor: Color.fromRGBO(82, 98, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminHome()));
              }),
          Bubble(
              icon: Icons.person,
              iconColor: Colors.black,
              title: 'Operator',
              titleStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
              bubbleColor: Color.fromRGBO(255, 171, 67, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminOperator()));
              }),
          Bubble(
              icon: Icons.add_circle_outlined,
              iconColor: Colors.black,
              title: 'New Network',
              titleStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
              bubbleColor: Color.fromRGBO(255, 171, 67, 1),
              onPress: () {
                _animationController!.reverse();
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              }),
        ],
        animation: _animation!,
        onPress: () => _animationController!.isCompleted
            ? _animationController!.reverse()
            : _animationController!.forward(),
        backGroundColor: Theme.of(context).primaryColor,
        iconColor: Colors.white,
        iconData: Icons.menu,
      ),
      backgroundColor: Color.fromRGBO(193, 214, 223, 1),
      extendBody: true,
      // bottomNavigationBar: DotBotoomBar(),
      appBar: SearchBar(
        titile: 'Network',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            planDetailsWidget(context)
          ],
        )

      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white24,
      scrollable: true,
      content: SizedBox(
        height: 285,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
                left: -10.0,
                top: -32.0,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent)),
                  child: const Text('Create New Plan'),
                )),
            Form(
                key: _planformkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        controller: planName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a Plan Name!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Plan Name",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.wifi,
                            color: Colors.black,
                          ),
                        ),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 230,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(8)),
                      child: DropdownButtonFormField(
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(items),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownvalue = value.toString();
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        controller: planPrice,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a Price!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Plan Price",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.currency_rupee,
                            color: Colors.black,
                          ),
                        ),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        controller: commissionPrice,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a Price!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Operator Commission",
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.currency_rupee,
                            color: Colors.black,
                          ),
                        ),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                            createPlan();
                            showToast();
                            Navigator.pop(context);
                        },
                        child: Text('Submit')),

                  ],
                )),
          ],
        ),
      ),
    );
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: "New Plan added Successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }



  Widget planDetailsWidget(BuildContext context){
    return StreamBuilder<QuerySnapshot>(stream: planDetails,
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
          return Column(
            children: [
              for (var i = 0; i < storedoc.length; i++)...[
                SizedBox(
                  child: Card(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child:ListTile(title: Text("${storedoc[i]['planName']}")),

                  ),
                ),
              ],

            ],
          );
        });
  }

  Future<void> createPlan() {
    return addplan.add({
      'planName': planName.text,
      'planPrice': planPrice.text,
      'planSpeed': dropdownvalue,
      'commissionPrice': commissionPrice.text
    });
  }

  DataTable networkTable() {
    return DataTable(
      border: TableBorder.all(),
      columns: _networkColumn(),
      rows: _networkRow(),
      dividerThickness: 5,
      dataRowHeight: 80,
      showBottomBorder: true,
      headingTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      headingRowColor:
          MaterialStateProperty.resolveWith((states) => Colors.black),
    );
  }

  List<DataColumn> _networkColumn() {
    return [
      const DataColumn(
          label: Text(
        "Action",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Network Name",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Users",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Topup",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Due amt.",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Respnsible Person",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Contact",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Address",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "PAN",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "GSTIN",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
    ];
  }

  List<DataRow> _networkRow() {
    return _network
        .map((network) =>
        DataRow(cells: [
              DataCell(Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu, color: Colors.deepOrange)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.receipt_long,
                          color: Colors.blueAccent))
                ],
              )),
              DataCell(Text(network['networkname'])),
              DataCell(Text(network['users'])),
              DataCell(Text(network['topup'])),
              DataCell(Text(network['dueamt'])),
              DataCell(Text(network['rperson'])),
              DataCell(Text(network['contact'])),
              DataCell(Text(network['address'])),
              DataCell(Text(network['PAN'])),
              DataCell(Text(network['gstn'])),
            ]),
    )
        .toList();
  }
}
