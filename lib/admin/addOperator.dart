

import 'package:bms/admin/adminWidget/adminDrawer.dart';
import 'package:bms/authentication.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/file_picker_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddOperator extends StatefulWidget {
  const AddOperator({Key? key}) : super(key: key);

  @override
  State<AddOperator> createState() => _AddOperatorState();
}

class _AddOperatorState extends State<AddOperator> {
  bool isVisible = false;
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  String dropdownvalue = 'Admin';
  var items = ['Admin', 'Operator'];
  late String countryValue;
  late String stateValue;
  late String cityValue;
  String document = 'Aadhar card';
  var documentitems = [
    'Customer App. Form',
    'Aadhar card',
    'PAN Card',
    'Driving License',
    'Passport',
    'Light Bill'
  ];
  bool value = false;
  var useridcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var fisrtnamecontroller = TextEditingController();
  var lastnamecontroller = TextEditingController();
  var aadharaddcontroller = TextEditingController();
  var distrctcontroller = TextEditingController();
  var talukacontroller = TextEditingController();
  var pincontroller = TextEditingController();
  var areatcontroller = TextEditingController();
  var landmarkctcontroller = TextEditingController();
  var lanectcontroller = TextEditingController();
  var roomctcontroller = TextEditingController();
  var mobilecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var pancontroller = TextEditingController();
  var gstncontroller = TextEditingController();
  var billingnamecontroller = TextEditingController();
  final _form = GlobalKey<FormState>();
  CollectionReference operator = FirebaseFirestore.instance.collection('operator');
  CollectionReference signup = FirebaseFirestore.instance.collection('collectionPath');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromRGBO(193, 214, 223, 1),
      appBar: SearchBar(titile: 'Add Operator'),
      drawer: AdminDrawer(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Form(
              key: _form,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade50,width: 5)
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              isVisible?
                              Icon(Icons.arrow_downward_outlined,color: Color(0xFF335175),)
                                  :Icon(Icons.arrow_forward_ios_outlined,color: Color(0xFF335175),),
                              TextButton(onPressed: (){
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              }, child: isVisible?
                              Text('Fill the form')
                                  :Text('CREDENTIALS'))
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isVisible,
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 8,right: 8,left: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadowColor: Colors.black,
                            elevation: 20,
                            color: const Color(0xFF778ba3),
                            child: Container(
                              margin: const EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      "CREDENTIALS",
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
                                      'User Type',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 32,
                                      width: 120,
                                      decoration: const BoxDecoration(),
                                      child: DropdownButton(
                                        value: dropdownvalue,
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text(items),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "User Id",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 60,
                                      child: TextFormField(
                                        controller: useridcontroller,
                                        validator: (v) {
                                          String? message;
                                          if (v == null || v.isEmpty) {
                                            return 'Please fill this field';
                                          }
                                          if (RegExp('.*[A-Z].*').hasMatch(v ?? '')) {
                                            message ??= '';
                                            message += 'Input should not contain an uppercase letter A-Z. ';
                                          }
                                          return message;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "User ID",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      "Password",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 60,
                                      child: TextFormField(
                                        obscureText: true,
                                        validator: (value1) {
                                          if (value1 == null || value1.isEmpty) {
                                            return 'Please fill this field';
                                          }
                                          return null;
                                        },
                                        controller: passwordcontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade50,width: 5)
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              isVisible1?
                              Icon(Icons.arrow_downward_outlined,color: Color(0xFF335175),)
                                  :Icon(Icons.arrow_forward_ios_outlined,color: Color(0xFF335175),),
                              TextButton(onPressed: (){
                                setState(() {
                                  isVisible1 = !isVisible1;
                                });
                              }, child: isVisible1?
                              Text('Fill the form')
                                  :Text('PERSONAL'))
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isVisible1,
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 8,right: 8,left: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadowColor: Colors.black,
                            elevation: 20,
                            color: Color(0xFF778ba3),
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
                                      height: 60,
                                      child: TextFormField(
                                        validator: (value1) {
                                          if (value1 == null || value1.isEmpty) {
                                            return 'Please fill this field';
                                          }
                                          return null;
                                        },
                                        controller: fisrtnamecontroller,
                                        decoration: const InputDecoration(
                                          hintText: "First Name",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      height: 60,
                                      child: TextFormField(
                                        controller: lastnamecontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Last Name",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      height: 60,
                                      child: TextFormField(
                                        validator: (value1) {
                                          if (value1 == null || value1.isEmpty) {
                                            return 'Please fill this field';
                                          }
                                          return null;
                                        },
                                        controller: emailcontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Email Id",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      height: 60,
                                      child: TextFormField(
                                        validator: (value1) {
                                          if (value1!.isEmpty) {
                                            return "Please Enter Mobile No";
                                          } else if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$')
                                              .hasMatch(value1)) {
                                            return "Please Enter a Valid Mobile No";
                                          }
                                          return null;
                                        },
                                        controller: mobilecontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Mobile no",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade50,width: 5)
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              isVisible2?
                              Icon(Icons.arrow_downward_outlined,color: Color(0xFF335175),)
                                  :Icon(Icons.arrow_forward_ios_outlined,color: Color(0xFF335175),),
                              TextButton(onPressed: (){
                                setState(() {
                                  isVisible2 = !isVisible2;
                                });
                              }, child: isVisible2?
                              Text('Fill the form')
                                  :Text('ADDRESS DETAILS'))
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isVisible2,
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 8,right: 8,left: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadowColor: Colors.black,
                            elevation: 40,
                            color: Color(0xFF778ba3),
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
                                    SelectState(
                                      dropdownColor: Colors.white,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                      onCountryChanged: (value) {
                                        setState(() {
                                          countryValue = value;
                                        });
                                      },
                                      onStateChanged: (value) {
                                        setState(() {
                                          stateValue = value;
                                        });
                                      },
                                      onCityChanged: (value) {
                                        setState(() {
                                          cityValue = value;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
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
                                      height: 60,
                                      child: TextFormField(
                                        controller: distrctcontroller,
                                        decoration: const InputDecoration(
                                          hintText: "District",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      height: 60,
                                      child: TextFormField(
                                        controller: talukacontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Taluka",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      height: 60,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        controller: pincontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Pin Code",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      height: 60,
                                      child: TextFormField(
                                        controller: areatcontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Area Name",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      height: 60,
                                      child: TextFormField(
                                        controller: landmarkctcontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Land Mark",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      height: 60,
                                      child: TextFormField(
                                        controller: lanectcontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Lane/CHS/Building",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      height: 60,
                                      child: TextFormField(
                                        controller: roomctcontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Details Address",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade50,width: 5)
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              isVisible3?
                              Icon(Icons.arrow_downward_outlined,color: Color(0xFF335175),)
                                  :Icon(Icons.arrow_forward_ios_outlined,color: Color(0xFF335175),),
                              TextButton(onPressed: (){
                                setState(() {
                                  isVisible3 = !isVisible3;
                                });
                              }, child: isVisible3?
                              Text('Fill the form')
                                  :Text('BILLING DETAILS'))
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isVisible3,
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 8,right: 8,left: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadowColor: Colors.black,
                            elevation: 20,
                            color: Color(0xFF778ba3),
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
                                      height: 60,
                                      child: TextFormField(
                                        controller: billingnamecontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Name",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      height: 60,
                                      child: TextFormField(
                                        controller: pancontroller,
                                        decoration: const InputDecoration(
                                          hintText: "PAN Card ",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      "GSTN Number",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 60,
                                      child: TextFormField(
                                        controller: gstncontroller,
                                        decoration: const InputDecoration(
                                          hintText: "GSTN No",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                                      height: 60,
                                      child: TextFormField(
                                        controller: aadharaddcontroller,
                                        decoration: const InputDecoration(
                                          hintText: "Aadhar No",
                                          hintStyle:
                                          TextStyle(color: Colors.grey, fontSize: 18),
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
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade50,width: 5)
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              isVisible4?
                              Icon(Icons.arrow_downward_outlined,color: Color(0xFF335175),)
                                  :Icon(Icons.arrow_forward_ios_outlined,color: Color(0xFF335175),),
                              TextButton(onPressed: (){
                                setState(() {
                                  isVisible4 = !isVisible4;
                                });
                              }, child: isVisible4?
                              Text('Fill the form')
                                  :Text('DOCUMENT DETAILS'))
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isVisible4,
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 8,right: 8,left: 8),
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 20,
                            color: Color(0xFF778ba3),
                            child: Container(
                              margin: const EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "DOCMUNTES",
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
                                    Container(
                                      height: 32,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey.shade400),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 100),
                                        child: DropdownButton(
                                          value: document,
                                          icon: const Icon(Icons.keyboard_arrow_down),
                                          items: documentitems.map((String items1) {
                                            return DropdownMenuItem(
                                              value: items1,
                                              child: Text(items1),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue1) {
                                            setState(() {
                                              document = newValue1!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const FilePickerWidget(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        if (_form.currentState!.validate()) {
                          // use the information provided
                          createUser();
                          signUP();
                          addOperator();
                          test();
                        }
                      }, icon: Icon(Icons.done)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.done)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.done)),

                    ],
                  )
                ],
              ),
            ),
          ),

      ),
    );
  }

  Future<void> test()async{
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e){
      print(e.toString());
    }
  }
  Future<void> createUser() async{
    var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
        url: 'https://bms.com/links/?link=https://example.com/my-resource',
        // This must be true
        handleCodeInApp: true,
        androidPackageName: 'com.example.bms',
        // installIfNotAvailable
        androidInstallApp: true,
        // minimumVersion
        androidMinimumVersion: '12');
    FirebaseAuth.instance.sendSignInLinkToEmail(
        email: useridcontroller.text, actionCodeSettings: acs)
        .catchError((onError) => print('Error sending email verification $onError'))
        .then((value) => print('Successfully sent email verification'));

  }


  Future<void> signUP(){
    return signup
        .add({
      'uname' : useridcontroller.text,
      'pass' : passwordcontroller.text,
      'role' : dropdownvalue
    });
  }

  Future<void> addOperator(){
    return operator
        .add({
      'fname': fisrtnamecontroller.text,
      'lname': lastnamecontroller.text,
      'mobileno': mobilecontroller.text,
      'email': emailcontroller.text,
      'country': countryValue,
      'state': stateValue,
      'city': cityValue,
      'dist': distrctcontroller.text,
      'taluka': talukacontroller.text,
      'pincode': pincontroller.text,
      'area': areatcontroller.text,
      'land': landmarkctcontroller.text,
      'lane': lanectcontroller.text,
      'roomno': roomctcontroller.text,
      'pan': pancontroller.text,
      'gstn': gstncontroller.text,
      'billing': billingnamecontroller.text,
      'aadharadd': aadharaddcontroller.text,
      'documenttype': document,
    });
  }
}
