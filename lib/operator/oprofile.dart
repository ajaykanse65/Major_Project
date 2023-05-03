import 'package:bms/customWidget/bottombar.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpProfile extends StatefulWidget {
  const OpProfile({Key? key,}) : super(key: key);
  @override
  State<OpProfile> createState() => _OpProfileState();
}

class _OpProfileState extends State<OpProfile> {
  String? userId;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> getUid() async{
    // final currentUser = FirebaseAuth.instance.currentUser;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    setState(() {
      userId = uid;
    });
  }
  var fname, lname, email, cno;
  var dist, taluka, pincode, area, land, building, room;
  var billingname, panno, aadharno;

  @override
  void initState() {
    getUid();
    print(userId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   foregroundColor: Colors.black,
      //   backgroundColor: const Color(0xFF496585),
      //
      //   icon: Icon(Icons.done,color: Colors.white,),
      //   onPressed: (){
      //     updateOP();
      //   }, label: Text('Update',style: TextStyle(color: Colors.white),),),
      // bottomNavigationBar: BotoomBar(selectedIndex: 4),
      backgroundColor: Color.fromRGBO(193, 214, 223, 1),
      appBar: SearchBar(titile: 'Profile Details'),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8,top: 15),
        child: SingleChildScrollView(
          child: FutureBuilder<DocumentSnapshot<Map <String, dynamic>>>(
            future: FirebaseFirestore.instance
            .collection('collectionPath').doc(userId).get(),
            builder: (_, snapshot){
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              var data = snapshot.data!.data();
              fname = data!['fname'];
              lname = data['lname'];
              email = data['email'];
              cno = data['mobileno'];
              dist = data['dist'];
              taluka = data['taluka'];
              pincode = data['pincode'];
              area = data['area'];
              land = data['land'];
              building = data['lane'];
              room = data['roomno'];
              billingname = data['billing'];
              panno = data['pan'];
              aadharno = data['aadharadd'];
              return
              Column(
                children: [
                  Card(
                    margin: const EdgeInsets.only(
                        bottom: 8, right: 8, left: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadowColor: Colors.black,
                    elevation: 20,
                    color: Colors.white60,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "PERSONAL DETAILS",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                              endIndent: 10,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "First Name",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                validator: (value1) {
                                  if (value1 == null || value1.isEmpty) {
                                    return 'Please fill this field';
                                  }
                                  return null;
                                },
                                initialValue: fname,
                                onChanged: (value)=> fname = value,
                                decoration: const InputDecoration(
                                  hintText: "First Name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Last Name",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                initialValue: lname,
                                onChanged: (value) => lname = value,
                                decoration: const InputDecoration(
                                  hintText: "Last Name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Email Id",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                validator: (value1) {
                                  if (value1 == null ||
                                      value1.isEmpty ||
                                      !value1.contains('@') ||
                                      !value1.contains('.')) {
                                    return 'Invalid Email';
                                  }
                                  return null;
                                },
                                initialValue: email,
                                onChanged: (value) => email = value,
                                decoration: const InputDecoration(
                                  hintText: "Email Id",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Mobile No.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                validator: (value1) {
                                  if (value1!.isEmpty) {
                                    return "Please Enter Mobile No";
                                  } else if (!RegExp(
                                      r'^(?:[+0]9)?[0-9]{10}$')
                                      .hasMatch(value1)) {
                                    return "Please Enter a Valid Mobile No";
                                  }
                                  return null;
                                },
                                initialValue: cno,
                                onChanged: (value) => cno = value,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: "Mobile no",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    margin: const EdgeInsets.only(
                        bottom: 8, right: 8, left: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadowColor: Colors.black,
                    elevation: 40,
                    color: Colors.white60,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "INSTALLATION ADDRESS",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                              endIndent: 10,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "District",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                initialValue: dist,
                                onChanged: (value) => dist = value,
                                decoration: const InputDecoration(
                                  hintText: "District",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Taluka",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                initialValue: taluka,
                                onChanged: (value) => taluka = value,
                                decoration: const InputDecoration(
                                  hintText: "Taluka",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Pin Code",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                initialValue: pincode,
                                onChanged: (value) => pincode = value,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please fill this field';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Pin Code",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Area Name",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                initialValue: area,
                                onChanged: (value) => area = value,
                                decoration: const InputDecoration(
                                  hintText: "Area Name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Landmark",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                initialValue: land,
                                onChanged: (value) => land = value,
                                decoration: const InputDecoration(
                                  hintText: "Land Mark",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Lane/CHS/Building",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                initialValue: building,
                                onChanged: (value) => building = value,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please fill this field';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Lane/CHS/Building",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Room No. / Details Address",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                initialValue: room,
                                onChanged: (value) => room = value,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Please fill this field';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Details Address",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Card(
                    margin: const EdgeInsets.only(
                        bottom: 8, right: 8, left: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadowColor: Colors.black,
                    elevation: 20,
                    color: Colors.white60,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Billing",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            const Divider(
                              endIndent: 10,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Billing Name",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                initialValue: billingname,
                                onChanged: (value) => billingname = value,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Please fill this field';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "PAN Number",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                initialValue: panno,
                                onChanged: (value) => panno =  value,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Please fill this field';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "PAN Card ",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Aadhar Number",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextFormField(
                                initialValue: aadharno,
                                onChanged: (value)=> aadharno = value,
                                validator: (v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Please fill this field';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Aadhar No",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100,),
                ],
              );
            },
          )
          // Column(
          //   children: [
          //     Card(
          //       margin: const EdgeInsets.only(
          //           bottom: 8, right: 8, left: 8),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //       shadowColor: Colors.black,
          //       elevation: 20,
          //       color: Colors.white60,
          //       child: Container(
          //         margin: const EdgeInsets.all(15),
          //         width: MediaQuery.of(context).size.width,
          //         child: Padding(
          //           padding: const EdgeInsets.all(12.0),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               const Text(
          //                 "PERSONAL DETAILS",
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 25,
          //                 ),
          //               ),
          //               const Divider(
          //                 color: Colors.black,
          //                 endIndent: 10,
          //               ),
          //               const SizedBox(
          //                 height: 15,
          //               ),
          //               const Text(
          //                 "First Name",
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 18,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               SizedBox(
          //                 height: 40,
          //                 child: TextFormField(
          //                   validator: (value1) {
          //                     if (value1 == null || value1.isEmpty) {
          //                       return 'Please fill this field';
          //                     }
          //                     return null;
          //                   },
          //                   controller: opfname,
          //                   decoration: const InputDecoration(
          //                     hintText: "First Name",
          //                     hintStyle: TextStyle(
          //                         color: Colors.grey, fontSize: 16),
          //                     border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.zero,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 20,
          //               ),
          //               const Text(
          //                 "Last Name",
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 18,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               SizedBox(
          //                 height: 40,
          //                 child: TextFormField(
          //                   controller: opfname,
          //                   decoration: const InputDecoration(
          //                     hintText: "Last Name",
          //                     hintStyle: TextStyle(
          //                         color: Colors.grey, fontSize: 16),
          //                     border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.zero,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 20,
          //               ),
          //               const Text(
          //                 "Email Id",
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 18,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               SizedBox(
          //                 height: 40,
          //                 child: TextFormField(
          //                   validator: (value1) {
          //                     if (value1 == null ||
          //                         value1.isEmpty ||
          //                         !value1.contains('@') ||
          //                         !value1.contains('.')) {
          //                       return 'Invalid Email';
          //                     }
          //                     return null;
          //                   },
          //                   controller: opemail,
          //                   decoration: const InputDecoration(
          //                     hintText: "Email Id",
          //                     hintStyle: TextStyle(
          //                         color: Colors.grey, fontSize: 16),
          //                     border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.zero,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 20,
          //               ),
          //               const Text(
          //                 "Mobile No.",
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 18,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               SizedBox(
          //                 height: 40,
          //                 child: TextFormField(
          //                   validator: (value1) {
          //                     if (value1!.isEmpty) {
          //                       return "Please Enter Mobile No";
          //                     } else if (!RegExp(
          //                         r'^(?:[+0]9)?[0-9]{10}$')
          //                         .hasMatch(value1)) {
          //                       return "Please Enter a Valid Mobile No";
          //                     }
          //                     return null;
          //                   },
          //                   controller: opcno,
          //                   inputFormatters: [
          //                     FilteringTextInputFormatter.digitsOnly
          //                   ],
          //                   keyboardType: TextInputType.number,
          //                   decoration: const InputDecoration(
          //                     hintText: "Mobile no",
          //                     hintStyle: TextStyle(
          //                         color: Colors.grey, fontSize: 16),
          //                     border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.zero,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     SizedBox(height: 10,),
          //     Card(
          //       margin: const EdgeInsets.only(
          //           bottom: 8, right: 8, left: 8),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //       shadowColor: Colors.black,
          //       elevation: 20,
          //       color: Colors.white60,
          //       child: Container(
          //         margin: const EdgeInsets.all(15),
          //         width: MediaQuery.of(context).size.width,
          //         child: Padding(
          //           padding: const EdgeInsets.all(12.0),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               const Text(
          //                 "PERSONAL DETAILS",
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 25,
          //                 ),
          //               ),
          //               const Divider(
          //                 color: Colors.black,
          //                 endIndent: 10,
          //               ),
          //               const SizedBox(
          //                 height: 15,
          //               ),
          //               const Text(
          //                 "First Name",
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 18,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               SizedBox(
          //                 height: 40,
          //                 child: TextFormField(
          //                   validator: (value1) {
          //                     if (value1 == null || value1.isEmpty) {
          //                       return 'Please fill this field';
          //                     }
          //                     return null;
          //                   },
          //                   controller: opfname,
          //                   decoration: const InputDecoration(
          //                     hintText: "First Name",
          //                     hintStyle: TextStyle(
          //                         color: Colors.grey, fontSize: 16),
          //                     border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.zero,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 20,
          //               ),
          //               const Text(
          //                 "Last Name",
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 18,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               SizedBox(
          //                 height: 40,
          //                 child: TextFormField(
          //                   controller: opfname,
          //                   decoration: const InputDecoration(
          //                     hintText: "Last Name",
          //                     hintStyle: TextStyle(
          //                         color: Colors.grey, fontSize: 16),
          //                     border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.zero,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 20,
          //               ),
          //               const Text(
          //                 "Email Id",
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 18,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               SizedBox(
          //                 height: 40,
          //                 child: TextFormField(
          //                   validator: (value1) {
          //                     if (value1 == null ||
          //                         value1.isEmpty ||
          //                         !value1.contains('@') ||
          //                         !value1.contains('.')) {
          //                       return 'Invalid Email';
          //                     }
          //                     return null;
          //                   },
          //                   controller: opemail,
          //                   decoration: const InputDecoration(
          //                     hintText: "Email Id",
          //                     hintStyle: TextStyle(
          //                         color: Colors.grey, fontSize: 16),
          //                     border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.zero,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 20,
          //               ),
          //               const Text(
          //                 "Mobile No.",
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 18,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               SizedBox(
          //                 height: 40,
          //                 child: TextFormField(
          //                   validator: (value1) {
          //                     if (value1!.isEmpty) {
          //                       return "Please Enter Mobile No";
          //                     } else if (!RegExp(
          //                         r'^(?:[+0]9)?[0-9]{10}$')
          //                         .hasMatch(value1)) {
          //                       return "Please Enter a Valid Mobile No";
          //                     }
          //                     return null;
          //                   },
          //                   controller: opcno,
          //                   inputFormatters: [
          //                     FilteringTextInputFormatter.digitsOnly
          //                   ],
          //                   keyboardType: TextInputType.number,
          //                   decoration: const InputDecoration(
          //                     hintText: "Mobile no",
          //                     hintStyle: TextStyle(
          //                         color: Colors.grey, fontSize: 16),
          //                     border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.zero,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //
          //   ],
          // ),
        ),
      ),
    );
  }

  Future<void> updateOP()async {
    DocumentReference documentReference = FirebaseFirestore.instance.collection('collectionPath').doc(userId.toString());
    Map<String, dynamic> data={
      'fname' : fname,
      'lname' : lname,
      'email' : email,
      'mobileno' : cno,
      'dist' : dist,
      'taluka': taluka,
      'pincode': pincode,
      'area': area,
      'land' : land,
      'lane': building,
      'roomno': room,
      'billing' : billingname,
      'pan' : panno,
      'aadharadd': aadharno

    };
    documentReference.update(data)
        .then((value) => debugPrint("Data Updates Successfully"))
        .catchError((e) => debugPrint("error: $e"));
  }
}
