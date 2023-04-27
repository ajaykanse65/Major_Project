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
import 'package:flutter_slidable/flutter_slidable.dart';
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
  CollectionReference planCollection = FirebaseFirestore.instance.collection('planDetails');
  final Stream<QuerySnapshot> planDetails = FirebaseFirestore.instance.collection('planDetails').snapshots();
  final List planList=[];
  var editplan ,editPrice ,editSpeed ,editopcm;
  // var updatename, updateSpeed, updatePrice, updatecmop;




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

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data()as Map<String, dynamic>;
            planList.add(a);
            a['idop'] = document.id;
          }).toList();
          return
            Expanded(
              child: ListView.builder(
                // physics: const AlwaysScrollableScrollPhysics(),
                // controller: _controller,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: planList.length,
                  itemBuilder: (BuildContext context, int index){
                    return
                      Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),),
                      color: Colors.blueGrey,
                      child: Slidable(
                        endActionPane: ActionPane(motion: const StretchMotion(), children: [
                          SlidableAction(onPressed: (context){
                            showDialog(context: context, builder: (BuildContext context) =>
                                editData(id:planList[index]['idop'])
                            );
                          },
                            label: 'Edit',
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                          )
                        ]),
                        startActionPane: ActionPane(motion: const StretchMotion(), children: [
                          SlidableAction(onPressed: (context) =>{
                            // deleteUser(_filterList[index]['idop'])
                          },
                            label: 'Delete',
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                          )
                        ]),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          title: Text("${planList[index]['planName']}"),
                          subtitle: Text("Plan Speed: ${planList[index]['planSpeed']} \nPlan Price: ${planList[index]['planPrice']}",style: const TextStyle(letterSpacing: 1,height: 1.2),),
                          trailing: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Validity:',style: const TextStyle(letterSpacing: 1,height: 1.2),),
                              Text('${planList[index]['duration']}',style: const TextStyle(letterSpacing: 1,height: 1.2),),
                               Text('OP Price: ${planList[index]['commissionPrice']}',style: const TextStyle(letterSpacing: 1,height: 1.2),),
                              // Text('${planList[index]['commissionPrice']}',style: const TextStyle(letterSpacing: 1,height: 1.2),),
                            ],
                          ),
                          leading: const CircleAvatar(
                            radius: 25,
                            backgroundImage:
                            // NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/WIFI_icon.svg/256px-WIFI_icon.svg.png'),
                            AssetImage('assets/wifi.png'),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
              ),
            );
        });
  }

  Widget editData({required String id}){
    return FutureBuilder<DocumentSnapshot<Map <String,dynamic>>>(
      future: FirebaseFirestore.instance
          .collection('planDetails')
          .doc(id)
          .get(),
      builder: (_, snapshot){
        if(snapshot.hasError){

        } if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        var data = snapshot.data!.data();
        editplan = data!['planName'];
        editPrice = data['planPrice'];
        editSpeed = data['planSpeed'];
        editopcm = data['commissionPrice'];
        // statusdrop = data['status'];

        return AlertDialog(
          title: const Text("Edit Details",style: TextStyle(color: Colors.black),),
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
                            child: Text('Plan Name:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0,top: 4.0),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.grey),
                                initialValue: editplan,
                                onChanged: (value)=> editplan = value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a Plan Name!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Plan Speed:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0,top: 4.0),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: TextFormField(style: const TextStyle(color: Colors.grey),
                                initialValue: editSpeed,
                                onChanged: (value)=> editSpeed = value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a Plan Speed!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Plan Price:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0,top: 4.0),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.grey),
                                initialValue: editPrice,
                                onChanged: (value)=> editPrice = value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a Price!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Commission Price',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0,top: 4.0),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.grey),
                                initialValue: editopcm,
                                onChanged: (value)=> editopcm = value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a Price!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(onTap: (){},
                                child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: const Text('Cancel',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),)),),
                              InkWell(onTap: (){
                                updateOP(id: id, fename: editplan, ltname: editPrice, ststu: editopcm, cnoo: editSpeed,);
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
      },
    );
  }

  Future<void> updateOP({required id, required fename,required ltname,required cnoo, required ststu})async {
    return planCollection
        .doc(id)
        .update({
      'planName': fename,
      'planPrice': ltname,
      'planSpeed':cnoo,
      'commissionPrice' : ststu
    }).then((v) => debugPrint('success'))
        .catchError((e) => debugPrint(e));
  }

  deleteUser(id){
    return planCollection
        .doc(id)
        .delete()
        .catchError((e) => debugPrint(e));
  }

  Future<void> createPlan() {
    return planCollection.add({
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
