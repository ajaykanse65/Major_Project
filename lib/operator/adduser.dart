import 'dart:convert';
import 'dart:io';

import 'package:bms/Utils/app_textstyle.dart';
import 'package:bms/admin/model/plandetails.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool isVisible = false;
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  bool isVisible5 = false;
  late String countryValue;
  late String stateValue;
  late String cityValue;
  String dropdownvalue = 'Individual';
  var items = ['Corporate', 'Individual'];
  String document = 'Aadhar card';
  var documentitems = [
    'Customer App. Form',
    'Aadhar card',
    'PAN Card',
    'Driving License',
    'Passport',
    'Light Bill'
  ];
  final _form = GlobalKey<FormState>();
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  var downlaodTask;

  @override
  void initState() {
    getUid();
    super.initState();
  }
  Future<void> getUid() async{
    final currentUser = await FirebaseAuth.instance.currentUser;
    setState(() {
      userId = currentUser!.uid;
    });
  }


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
  var billingnamecontroller = TextEditingController();
  final Stream<QuerySnapshot> planStream =
      FirebaseFirestore.instance.collection('planDetails').snapshots();
  var selectedPlan ='0';
  var planId="";
  var planPrice, planSpeed, commissionPrice, duration, planName;
  String? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromRGBO(193, 214, 223, 1),
      appBar: const SearchBar(titile: 'Add User'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Create new User here...!',
                      style: AppTextStyle.instance.headlineMedium),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade50, width: 5)),
                  child: Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            isVisible
                                ? const Icon(
                                    Icons.arrow_downward_outlined,
                                    color: Color(0xFF335175),
                                  )
                                : const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Color(0xFF335175),
                                  ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                child: isVisible
                                    ? const Text('Fill the form')
                                    : const Text('CREDENTIALS'))
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: Card(
                          margin: const EdgeInsets.only(
                              bottom: 8, right: 8, left: 8),
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
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
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
                                    height: 10,
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
                                    height: 40,
                                    child: TextFormField(
                                      controller: useridcontroller,
                                      validator: (v) {
                                        if (v == null || v.isEmpty) {
                                          return 'Please fill this field';
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        hintText: "User ID",
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
                                    height: 40,
                                    child: TextFormField(
                                      obscureText: true,
                                      validator: (value1) {
                                        if (value1 == null || value1.isEmpty) {
                                          return 'Please fill this field';
                                        }
                                        if (value1.length < 6) {
                                          return "Password must be atleast 6 characters long";
                                        }
                                        if (value1.length > 20) {
                                          return "Password must be less than 20 characters";
                                        }
                                        if (!value1
                                            .contains(RegExp(r'[0-9]'))) {
                                          return "Password must contain a number";
                                        }
                                        return null;
                                      },
                                      controller: passwordcontroller,
                                      decoration: const InputDecoration(
                                        hintText: "Password",
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
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade50, width: 5)),
                  child: Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            isVisible1
                                ? const Icon(
                                    Icons.arrow_downward_outlined,
                                    color: Color(0xFF335175),
                                  )
                                : const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Color(0xFF335175),
                                  ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible1 = !isVisible1;
                                  });
                                },
                                child: isVisible1
                                    ? const Text('Fill the form')
                                    : const Text('PERSONAL'))
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isVisible1,
                        child: Card(
                          margin: const EdgeInsets.only(
                              bottom: 8, right: 8, left: 8),
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
                                      controller: fisrtnamecontroller,
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
                                      controller: lastnamecontroller,
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
                                      controller: emailcontroller,
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
                                      controller: mobilecontroller,
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
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade50, width: 5)),
                  child: Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            isVisible2
                                ? const Icon(
                                    Icons.arrow_downward_outlined,
                                    color: Color(0xFF335175),
                                  )
                                : const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Color(0xFF335175),
                                  ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible2 = !isVisible2;
                                  });
                                },
                                child: isVisible2
                                    ? const Text('Fill the form')
                                    : const Text('ADDRESS DETAILS'))
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isVisible2,
                        child: Card(
                          margin: const EdgeInsets.only(
                              bottom: 8, right: 8, left: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadowColor: Colors.black,
                          elevation: 40,
                          color: const Color(0xFF778ba3),
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
                                    height: 40,
                                    child: TextFormField(
                                      controller: distrctcontroller,
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
                                      controller: talukacontroller,
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
                                      controller: pincontroller,
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
                                      controller: areatcontroller,
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
                                      controller: landmarkctcontroller,
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
                                      controller: lanectcontroller,
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
                                      controller: roomctcontroller,
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
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade50, width: 5)),
                  child: Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            isVisible3
                                ? const Icon(
                                    Icons.arrow_downward_outlined,
                                    color: Color(0xFF335175),
                                  )
                                : const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Color(0xFF335175),
                                  ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible3 = !isVisible3;
                                  });
                                },
                                child: isVisible3
                                    ? const Text('Fill the form')
                                    : const Text('BILLING DETAILS'))
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isVisible3,
                        child: Card(
                          margin: const EdgeInsets.only(
                              bottom: 8, right: 8, left: 8),
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
                                      controller: billingnamecontroller,
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
                                  Container(
                                    height: 32,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade400),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 100),
                                      child: planData(context),
                                    ),
                                  ),
                                  // selectedPlan != null ? Container(child: Text(planSpeed),):Text('data'),

                                  //  SizedBox(
                                  //   child: Visibility(
                                  //     visible: isVisible5,
                                  //       child: Row(
                                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //         children: [
                                  //           Text("Speed:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                                  //           Text(planSpeed,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),//           Text("Price:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                                  //           Text("${planPrice}₹",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
                                  //           Text("Validity:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14),),
                                  //           Text(duration,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)
                                  //         ],
                                  //       )),
                                  // ),
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
                                      controller: pancontroller,
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
                                      validator: (v) {
                                        if (v == null || v.isEmpty) {
                                          return 'Please fill this field';
                                        }
                                        return null;
                                      },
                                      controller: aadharaddcontroller,
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
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade50, width: 5)),
                  child: Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            isVisible4
                                ? const Icon(
                                    Icons.arrow_downward_outlined,
                                    color: Color(0xFF335175),
                                  )
                                : const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Color(0xFF335175),
                                  ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible4 = !isVisible4;
                                  });
                                },
                                child: isVisible4
                                    ? const Text('Fill the form')
                                    : const Text('DOCUMENT DETAILS'))
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isVisible4,
                        child: Card(
                          margin: const EdgeInsets.only(
                              bottom: 8, right: 8, left: 8),
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 20,
                          color: const Color(0xFF778ba3),
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
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items:
                                            documentitems.map((String items1) {
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            selectFile();
                                          },
                                          child: const Text(
                                            'Choose File',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ),
                                          )),
                                      ElevatedButton(
                                          onPressed: () {
                                            uploadFile();
                                          },
                                          child: const Text(
                                            'Upload File',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ),
                                          )),
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
                    IconButton(
                        onPressed: () async {
                          if (_form.currentState!.validate()) {
                            _form.currentState!.save();
                            getUid();
                            addUser();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.white,
                                content: Text(
                                  'Please fill the empty field...',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.done)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.done)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.done)),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

   addUser() {
    DocumentReference parentDocRef = FirebaseFirestore.instance.collection('collectionPath').doc(userId.toString());
    CollectionReference subCollectionRef = parentDocRef.collection('UserCollection');
    Map<String, dynamic> data= {
      "userType" : dropdownvalue.toString(),
      "userId": useridcontroller.text,
      "password": passwordcontroller.text,
      "fname" : fisrtnamecontroller.text,
      "lanme": lastnamecontroller.text,
      "emailid": emailcontroller.text,
      "mobileNo" : mobilecontroller.text,
      "country" : countryValue.toString(),
      "state" : stateValue.toString(),
      "city" : cityValue.toString(),
      "dist" : distrctcontroller.text,
      "taluka" : talukacontroller.text,
      "pinCode" : pincontroller.text,
      "areaName" : areatcontroller.text,
      "landmark" : landmarkctcontroller.text,
      "buildingName" : lanectcontroller.text,
      "roomNo" : roomctcontroller.text,
      "billingName" : billingnamecontroller.text,
      "planName" : planName.toString(),
      "planSpeed": planSpeed.toString(),
      "planPrice": planPrice.toString(),
      "validity": duration.toString(),
      "panNo" : pancontroller.text,
      "aadharNo": aadharaddcontroller.text,
      "documentURL": downlaodTask.toString(),
      "status": "Pending"
    };
    subCollectionRef.doc().set(data)
    .then((value) => debugPrint("Data Added Successfully"))
    .catchError((e) => debugPrint("error: $e"));
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
                        data['planName'],
                      ),
                    ),
                  );
                }
              }
              return DropdownButton<dynamic>(
                items: planItems,
                icon: const Icon(
                    Icons.keyboard_arrow_down),
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

  Future uploadFile() async {
    final path = 'files/users/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    var ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {});

    final downloadurl = await snapshot.ref.getDownloadURL();
    setState(() {
      downlaodTask = downloadurl.toString();
    });
  }

  Future selectFile() async {
    final file = await FilePicker.platform.pickFiles();
    if (file == null) return;
    setState(() {
      pickedFile = file.files.first;
    });
  }
}
