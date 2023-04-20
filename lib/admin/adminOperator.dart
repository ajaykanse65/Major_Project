import 'dart:math';

import 'package:bms/admin/addOperator.dart';
import 'package:bms/admin/adminHome.dart';
import 'package:bms/admin/adminNetwrok.dart';
import 'package:bms/admin/adminWidget/adminDrawer.dart';
import 'package:bms/admin/model/operatorDetails.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AdminOperator extends StatefulWidget {
  const AdminOperator({Key? key}) : super(key: key);

  @override
  State<AdminOperator> createState() => _AdminOperatorState();
}

class _AdminOperatorState extends State<AdminOperator> with SingleTickerProviderStateMixin {

  final Stream<QuerySnapshot> userStream = FirebaseFirestore.instance.collection('operator').snapshots();
  CollectionReference opCollection = FirebaseFirestore.instance.collection('operator');
  Animation<double>? _animation;
  AnimationController? _animationController;
  String name= '';


  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  String dropdownvaluetest = 'All';
  var itemstest = ['All','Approved','Pending','Rejected','Active','Deactivate',];

  String updateDropdownvalue = 'Pending';
  var itemsUpdate = ['Pending','Approved','Rejected','Active','Deactivated'];

  final TextEditingController _searchController = TextEditingController();
  var fisrtname, lastname, emailid, cno, statusdrop, docname;


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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHome()));
              }),
          Bubble(
              icon: Icons.network_check,
              iconColor: Colors.black,
              title: 'Network',
              titleStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: const Color.fromRGBO(46, 198, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminNetwork()));
              }),
          Bubble(
              icon: Icons.add_circle_outlined,
              iconColor: Colors.black,
              title: 'New Operator',
              titleStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: const Color.fromRGBO(46, 198, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  const AddOperator()));
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
      drawer: const AdminDrawer(),
     appBar: const SearchBar(titile: 'Operator'),
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
  Widget editData({required String id}){
    return FutureBuilder<DocumentSnapshot<Map <String,dynamic>>>(
      future: FirebaseFirestore.instance
          .collection('operator')
          .doc(id)
          .get(),
      builder: (_, snapshot){
        if(snapshot.hasError){

        } if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        var data = snapshot.data!.data();
        fisrtname = data!['fname'];
        lastname = data['lname'];
        emailid = data['email'];
        cno = data['mobileno'];
        statusdrop = data['status'];
        print(emailid);

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
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: DropdownButton(
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
                                    statusdrop = updateDropdownvalue;
                                  });
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
                                updateOP(id: id, fename: fisrtname, ltname: lastname, ststu: statusdrop, cnoo: cno, email: emailid,);
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

  Future<void> updateOP({required id, required fename,required ltname,required email,required cnoo, required ststu})async {
    return opCollection
        .doc(id)
        .update({
      'fname': fename,
      'lname': ltname,
      'email': email,
      'mobileno':cnoo,
      'status' : ststu
        }).then((v) => debugPrint('success'))
    .catchError((e) => debugPrint(e));
  }

  Widget test(){
    return AlertDialog(
      content: ClipRRect(
        child: Image.network("https://firebasestorage.googleapis.com/v0/b/majorproject-3dbfa.appspot.com/o/files%2FIMG_20230415_125124.jpg?alt=media&token=0df2fab2-d59f-4fd2-85ca-de4318617efa",fit: BoxFit.fill,),
      ),
    );
  }
  Widget table(BuildContext context){
    return StreamBuilder<QuerySnapshot>(stream: userStream,
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
                    title: Text("${storedoc[i]['fname']} ${storedoc[i]['lname']}"),
                    subtitle: Text("${storedoc[i]['email']} \nContact No: ${storedoc[i]['mobileno']}",style: const TextStyle(letterSpacing: 1,height: 1.2),),
                    trailing: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Status:',style: const TextStyle(letterSpacing: 1,height: 1.2),),
                      Text('${storedoc[i]['status']}',style: const TextStyle(letterSpacing: 1,height: 1.2),),
                      const Text('Balance: 100',style: const TextStyle(letterSpacing: 1,height: 1.2),),
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

   deleteUser(id){
    return opCollection
        .doc(id)
        .delete()
        .catchError((e) => debugPrint(e));
  }

}
