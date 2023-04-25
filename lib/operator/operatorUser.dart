

import 'package:bms/operator/OperatorWidget/operatorDrawer.dart';
import 'package:bms/operator/adduser.dart';
import 'package:bms/operator/operatorHome.dart';
import 'package:bms/operator/operatorNetwork.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OperatorUsers extends StatefulWidget {
  const OperatorUsers({Key? key}) : super(key: key);

  @override
  State<OperatorUsers> createState() => _OperatorUsersState();
}

class _OperatorUsersState extends State<OperatorUsers> with SingleTickerProviderStateMixin{
  Animation<double>? _animation;
  AnimationController? _animationController;

  String? userId;
  Future<void> getUid() async{
    final currentUser = await FirebaseAuth.instance.currentUser;
    setState(() {
      userId = currentUser!.uid;
    });
  }
  @override
  void initState() {
    getUid();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }
  String name= '';
  String dropdownvaluetest = 'All';
  var itemstest = ['All','Approved','Pending','Rejected','Active','Deactivate',];

  final TextEditingController _searchController = TextEditingController();
  var fisrtname, lastname, emailid, cno, statusdrop, docname;

  String updateDropdownvalue = 'Pending';
  var itemsUpdate = ['Pending','Approved','Rejected','Active','Deactivated'];

  final Stream<QuerySnapshot> planStream =
  FirebaseFirestore.instance.collection('planDetails').snapshots();
  var selectedPlan ='0';
  var planId="";
  var planPrice, planSpeed, commissionPrice, duration, planName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
              icon: Icons.home,
              iconColor: Colors.black,
              title: 'DashBoard',
              titleStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor:   const Color.fromRGBO(82, 98, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OperatorHome()));
              }),
          Bubble(
              icon: Icons.network_check,
              iconColor: Colors.black,
              title: 'Network',
              titleStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: const Color.fromRGBO(46, 198, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OperatorNetwork()));
              }),
          Bubble(
              icon: Icons.add_circle_outlined,
              iconColor: Colors.black,
              title: 'New User',
              titleStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: const Color.fromRGBO(46, 198, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  const AddUser()));
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
      backgroundColor: const Color.fromRGBO(193, 214, 223, 1),
      appBar: SearchBar(titile: 'User'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search...'
                ),
                onChanged: (val){
                  setState(() {
                    name= val;
                  });
                },
              ),
              DropdownButton(
                value: dropdownvaluetest,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: itemstest.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvaluetest = newValue!;
                  });
                },
              ),
              table(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget table(BuildContext context){
    return StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('collectionPath').doc(userId).collection('UserCollection').snapshots(),
        builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
          }if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          final List storedoc= [];

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data()as Map<String, dynamic>;
            storedoc.add(a);
            a['idop'] = document.id;
            // print(a['idop'] = document.id);
          }).toList();
          return Column(
            children: [
              for (var i = 0; i < storedoc.length; i++)...[
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),),
                  color: Colors.blueGrey,
                  child: Slidable(
                    endActionPane: ActionPane(motion: const StretchMotion(), children: [
                      SlidableAction(onPressed: (context){
                        showDialog(context: context, builder: (BuildContext context) =>
                            editData(id:storedoc[i]['idop'])
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
                        deleteUser(storedoc[i]['idop'])
                      },
                        label: 'Delete',
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                      )
                    ]),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      title: Text("${storedoc[i]['fname']} ${storedoc[i]['lanme']}"),
                      subtitle: Text("${storedoc[i]['emailid']} \nContact No: ${storedoc[i]['mobileNo']}",style: const TextStyle(letterSpacing: 1,height: 1.2),),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Status:',style: const TextStyle(letterSpacing: 1,height: 1.2),),
                          Text('${storedoc[i]['status']}',style: const TextStyle(letterSpacing: 1,height: 1.2),),
                           Text('Plan: ${storedoc[i]['planName']}',style: const TextStyle(letterSpacing: 1,height: 1.2),),
                          // Text('${storedoc[i]['planName']}',style: const TextStyle(letterSpacing: 1,height: 1.2),),
                        ],
                      ),
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage('https://e7.pngegg.com/pngimages/518/64/png-clipart-person-icon-computer-icons-user-profile-symbol-person-miscellaneous-monochrome.png'),
                      ),
                    ),
                  ),
                ),
              ]
            ],
          );
          // SizedBox(
          //   child: Card(
          //     child: Column(
          //       children: [ for (var i = 0; i < storedoc.length; i++)...[
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text("${storedoc[i]['fname']} ${storedoc[i]['lname']}"),
          //             const Text('Op no'),
          //             Text("${storedoc[i]['mobileno']}")
          //           ],
          //         ),]
          //       ],
          //     ),
          //   ),
          // );
          //   Column(
          //     children: [
          //       for (var i = 0; i < storedoc.length; i++)...[
          //         SizedBox(
          //           child: Card(
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(25),
          //             ),
          //             child: Container(
          //               margin: const EdgeInsets.all(10),
          //               width: MediaQuery.of(context).size.width,
          //               child: Column(
          //                 children: [
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Image.network('https://e7.pngegg.com/pngimages/518/64/png-clipart-person-icon-computer-icons-user-profile-symbol-person-miscellaneous-monochrome.png',scale: 10,),
          //                       Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Text('${storedoc[i]['fname']} ${storedoc[i]['lname']}',style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,),),
          //                           Text('Email ID: ${storedoc[i]['email']}',style: const TextStyle(color: Colors.white,fontSize: 14,),),
          //                           Text('Contact No.: ${storedoc[i]['mobileno']}',style:const TextStyle(color: Colors.white,fontSize: 14,),)
          //                         ],
          //                       ),
          //                       Column(
          //                         children: [
          //                           InkWell(onTap: (){
          //
          //                           },
          //                             child: Icon(Icons.edit),
          //                           ),
          //                           InkWell(onTap: (){
          //
          //                           },
          //                             child: Icon(Icons.delete),
          //                           ),
          //                           InkWell(onTap: (){
          //                             setState(() {
          //                               _isVisible = storedoc[i]['visible'];
          //                             });
          //                           },child: Icon(Icons.keyboard_arrow_down_sharp),)
          //                           // IconButton(onPressed: (){print('object');}, icon: Icon(Icons.edit)),
          //                           // IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
          //                           // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_downward))
          //                         ],
          //                       )
          //                     ],
          //                   ),
          //                   Visibility(visible: _isVisible,child: Container(color: Colors.cyan,height: 50,))
          //                 ],
          //               )
          //             ),
          //           ),
          //         ),
          //       ],
          //
          //     ],
          //   );
        });
  }

  Widget editData({required String id}){
    return FutureBuilder<DocumentSnapshot<Map <String,dynamic>>>(
      future: FirebaseFirestore.instance
          .collection('collectionPath')
          .doc(userId)
      .collection('UserCollection')
      .doc(id)
          .get(),
      builder: (_, snapshot){
        if(snapshot.hasError){

        } if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        var data = snapshot.data!.data();
        fisrtname = data!['fname'];
        lastname = data['lanme'];
        emailid = data['emailid'];
        cno = data['mobileNo'];
        statusdrop = data['status'];


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
                            child: Text('First Name:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
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
                                initialValue: fisrtname,
                                onChanged: (value)=> fisrtname = value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a Full Name!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Last Name:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
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
                                initialValue: lastname,
                                onChanged: (value)=> lastname = value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a Full Name!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Email ID:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
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
                                initialValue: emailid,
                                onChanged: (value)=> emailid = value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a Full Name!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Contact No.',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
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
                                initialValue: cno,
                                onChanged: (value)=> cno = value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a Full Name!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child:
                            Text('Documents',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child:
                            Text('Documents Name',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Status:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
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
                                    child: Text(items,style: const TextStyle(color: Colors.black),),

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
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0,top: 4.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: planData(context),
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
                                updateOP(id: id, fename: fisrtname, ltname: lastname, ststu: updateDropdownvalue, cnoo: cno, email: emailid,);
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

  Widget planData(BuildContext context) {
    return
      StreamBuilder<QuerySnapshot>(
          stream: planStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            List<DropdownMenuItem> planItems = [];
            if (!snapshot.hasData) {
            } else {
              final plandata = snapshot.data?.docs.reversed.toList();
              planItems.add(const DropdownMenuItem(
                  value: "0",
                  child: Text("Select Plan")));
              for (var data in plandata!) {
                planItems.add(
                  DropdownMenuItem(
                    value: data.id,
                    child: Text(
                        data['planName'],style: TextStyle(color: Colors.black),
                      ),

                  ),
                );
              }
            }
            return DropdownButtonFormField<dynamic>(
              items: planItems,
              icon: const Icon(
                  Icons.keyboard_arrow_down,color: Colors.black,),
              onChanged: (planvalue) {
                setState(() {
                  selectedPlan = planvalue!;
                  planId = planvalue!;
                  getData();
                });
                print(planId);
                print(planSpeed);
              },
              isExpanded: true,
              value: selectedPlan,
            );
          });


  }

  Future<void> getData() async{
    var collection = FirebaseFirestore.instance.collection('planDetails');
    var docSnapshot = await collection.doc(planId.toString()).get();
    if(docSnapshot.exists){
      Map<String, dynamic>? data = docSnapshot.data();
      planPrice = data?['planPrice'];
      planSpeed = data?['planSpeed'];
      commissionPrice = data?['commissionPrice'];
      duration = data?['duration'];
      planName = data?['planName'];
    }
  }

  Future<void> updateOP({required id, required fename,required ltname,required email,required cnoo, required ststu})async {
    DocumentReference parentDocRef = FirebaseFirestore.instance.collection('collectionPath').doc(userId.toString());
    CollectionReference subCollectionRef = parentDocRef.collection('UserCollection');
    Map<String,dynamic> data={
      'fname' : fename,
      'lanme': ltname,
      'emailid' : email,
      'mobileNo' : cnoo,
      'status' : ststu,
      "planName" : planName.toString(),
      "planSpeed": planSpeed.toString(),
      "planPrice": planPrice.toString(),
      "validity": duration.toString(),
    };
    subCollectionRef.doc(id).update(data)
        .then((value) => debugPrint("Data Updates Successfully"))
        .catchError((e) => debugPrint("error: $e"));
    // return loginCollection
    //     .doc(id)
    //     .update({
    //   'fname': fename,
    //   'lname': ltname,
    //   'email': email,
    //   'mobileno':cnoo,
    //   'status' : ststu
    // }).then((v) => debugPrint('success'))
    //     .catchError((e) => debugPrint(e));
  }

  deleteUser(id){
    DocumentReference parentDocRef = FirebaseFirestore.instance.collection('collectionPath').doc(userId.toString());
    CollectionReference subCollectionRef = parentDocRef.collection('UserCollection');
    subCollectionRef.doc(id)
    .delete()
    .catchError((e) => debugPrint(e));
  }
}
