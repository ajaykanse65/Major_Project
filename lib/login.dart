import 'dart:convert';

import 'package:bms/Utils/app_color.dart';
import 'package:bms/admin/adminHome.dart';
import 'package:bms/authentication.dart';
import 'package:bms/main.dart';
import 'package:bms/operator/operatorHome.dart';
import 'package:bms/page/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:bms/service/usermanagement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rive/rive.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Utils/loading_dialog.dart';


class LoginPage2 extends StatefulWidget {
  const LoginPage2({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage2> {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController idEmailController = TextEditingController();
  FocusNode userFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool loading =  false;
  String? FCMtoken = " ";
  String hintText2 = 'Password';


  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;


  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;

  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    // FirebaseMessaging.instance.getToken().then((token) {
    //   setState(() {
    //     FCMtoken = token;
    //   });
    //   // savetoken(token!);
    // });
  }


  @override
  void dispose() {
    userFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    nameController.dispose();
    locationController.dispose();
    contactController.dispose();
    idEmailController.dispose();
    super.dispose();
  }

  void emailFocus() {
    isChecking?.change(userFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  bool _isHidden = true;
  String dropdownvalue = 'Admin';
  var items = ['Admin', 'Operator'];


  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  final _formkey = GlobalKey<FormState>();
  final _OPformkey = GlobalKey<FormState>();
  final Stream<QuerySnapshot> userStream = FirebaseFirestore.instance.collection('collectionPath').snapshots();
  CollectionReference opResponse = FirebaseFirestore.instance.collection('opResponse');

  void showNotification() {
    flutterLocalNotificationsPlugin.show(0, 'Test', 'Its Done', NotificationDetails(
        android: AndroidNotificationDetails(
            channel.id, channel.name, channel.description,
            playSound: true,
            color: Colors.blue,
            icon: '@mipmap/ic_launcher',
            importance: Importance.high
        )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6E2EA),
      // backgroundColor: Colors.deepOrangeAccent.shade200,
      // backgroundColor: Colors.deepOrangeAccent.shade200,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                children:  [
                  const SizedBox(height: 20,),
                  Text("Welcome",
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 250,width: 300,
                    child: RiveAnimation.asset("assets/animated-login-screen.riv",
                      fit: BoxFit.fitHeight,
                      onInit: (artboard){
                        controller = StateMachineController.fromArtboard(
                          artboard,

                          /// from rive, you can see it in rive editor
                          "Login Machine",
                        );
                        if (controller == null) return;

                        artboard.addController(controller!);
                        isChecking = controller?.findInput("isChecking");
                        numLook = controller?.findInput("numLook");
                        isHandsUp = controller?.findInput("isHandsUp");
                        trigSuccess = controller?.findInput("trigSuccess");
                        trigFail = controller?.findInput("trigFail");
                      },
                    ),
                  ),
                  Form(
                    key: _formkey,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your email address';
                                }
                                // Check if the entered email has the right format
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return 'Please enter a valid email address';
                                }
                                // Return null if the entered email is valid
                                return null;
                              },
                              focusNode: userFocusNode,
                              controller: userController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.verified_user,color: Colors.black,),
                                  border: InputBorder.none,
                                  hintText: "User Name",
                                  hintStyle: TextStyle(color: Colors.black)
                              ),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'This field is required';
                                }
                                if (value.trim().length < 6) {
                                  return 'Password must be at least 6 characters in length';
                                }
                                // Return null if the entered username is valid
                                return null;
                              },
                              focusNode: passwordFocusNode,
                              controller: passwordController,
                              decoration:  const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(Icons.lock,color: Colors.black,),
                              ),
                              obscureText: true,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(height: 8,),
                          const SizedBox(height: 10,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)
                                ),
                              ),
                              onPressed: () async{
                                userFocusNode.unfocus();
                                passwordFocusNode.unfocus();
                                final bool? isValid = _formkey.currentState?.validate();

                                  showLoadingDialog(context);

                                  await Future.delayed(const Duration(milliseconds:2000 ));

                                  if(mounted) Navigator.pop(context);
                                  AuthenticationHelper().signIn(email: userController.text, password: passwordController.text, context: context);


                                // await Future.delayed(const Duration(milliseconds:3500 ));
                                // UserManagemnt().authorizeAccess(context);
                                // signInUser(context);
                              },
                              child: const Text("Login",
                                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered))
                            return Colors.blue.withOpacity(0.04);
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed))
                            return Colors.blue.withOpacity(0.12);
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupDialog(context),
                      );
                    },
                    child: const Text("Want to join as a Operator ? Click Here..!"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context){
   return AlertDialog(
     content: SingleChildScrollView(
       child: Stack(
         clipBehavior: Clip.none,
         children: <Widget>[
           Positioned(
             right: -40.0,
             top: -40.0,
             child: InkResponse(
               onTap: () {
                 Navigator.of(context).pop();
                 nameController.clear();
                 contactController.clear();
                 locationController.clear();
                 idEmailController.clear();
               },
               child: const CircleAvatar(
                 backgroundColor: Color(0xFF11253d),
                 child:Icon(Icons.close),
               ),
             ),
           ),
           Form(
             key: _OPformkey,
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     decoration: BoxDecoration(
                         color: Colors.grey[200],
                         borderRadius: BorderRadius.circular(8)
                     ),
                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                     child: TextFormField(
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Enter a Full Name!';
                         }
                         return null;
                       },
                       controller: nameController,
                       decoration:  const InputDecoration(
                         border: InputBorder.none,
                         hintText: "Full Name",
                         hintStyle: TextStyle(color: Colors.black),
                         prefixIcon: Icon(Icons.person,color: Colors.black,),
                       ),
                       style:const TextStyle(color: Colors.black,fontSize: 14),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     decoration: BoxDecoration(
                         color: Colors.grey[200],
                         borderRadius: BorderRadius.circular(8)
                     ),
                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                     child: TextFormField(
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Enter Area Name!';
                         }
                         return null;
                       },
                       controller: locationController,
                       decoration:  const InputDecoration(
                         border: InputBorder.none,
                         hintText: "Area Name",
                         hintStyle: TextStyle(color: Colors.black),
                         prefixIcon: Icon(Icons.location_on,color: Colors.black,),
                       ),
                       style:const TextStyle(color: Colors.black,fontSize: 14),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     decoration: BoxDecoration(
                         color: Colors.grey[200],
                         borderRadius: BorderRadius.circular(8)
                     ),
                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                     child: TextFormField(
                       validator: (value) {
                         if (value!.isEmpty) {
                           return 'Enter a valid Contact no!';
                         }
                         return null;
                       },
                       controller: contactController,
                       decoration:  const InputDecoration(
                         border: InputBorder.none,
                         hintText: "Contact No.",
                         hintStyle: TextStyle(color: Colors.black),
                         prefixIcon: Icon(Icons.call,color: Colors.black,),
                       ),
                       style:const TextStyle(color: Colors.black,fontSize: 14),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     decoration: BoxDecoration(
                         color: Colors.grey[200],
                         borderRadius: BorderRadius.circular(8)
                     ),
                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                     child: TextFormField(
                       validator: (value) {
                         if (value == null || value.trim().isEmpty) {
                           return 'Please enter your email address';
                         }
                         // Check if the entered email has the right format
                         if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                           return 'Please enter a valid email address';
                         }
                         // Return null if the entered email is valid
                         return null;
                       },
                       controller: idEmailController,
                       decoration:  const InputDecoration(
                         border: InputBorder.none,
                         hintText: "Email Id",
                         hintStyle: TextStyle(color: Colors.black),
                         prefixIcon: Icon(Icons.email,color: Colors.black,),
                       ),
                       style:const TextStyle(color: Colors.black,fontSize: 14),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(16)
                       ),
                     ),
                     onPressed: () async{
                       if (_OPformkey.currentState!.validate()) {
                         // showNotification();
                         sendEmail();
                         send();
                         sendUserEmail();
                       }
                       Navigator.pop(context);
                     },
                     child: const Text("Submit",
                       style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                     ),
                   )
                 )
               ],
             ),
           ),
         ],
       ),
     ),
   );
  }

  Future sendEmail() async{
    final uri = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_hi9ygcc";
    const templateId = "template_ufkk9mr";
    const userId = "_tWWKkHCqnW_moGJy";
    final res = await http.post(uri,
        headers: {'Content-Type': 'application/json','origin': 'http://localhost'},
        body: json.encode({
          "service_id": serviceId,
          "template_id" : templateId,
          "user_id" : userId,
          "template_params" : {
            "name": nameController.text,
            "subject" : "New Operator Request",
            "message": "I want to know about Operator Registration,here is my location ${locationController.text} and this is my contact no ${contactController.text} ",
            "user_email" : idEmailController.text
          }
        })
    );print(res.statusCode);
    Fluttertoast.showToast(msg: 'Response submitted successfully...!');
    return res.statusCode;
  }
  Future sendUserEmail() async{
    final uri = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = "service_hi9ygcc";
    const templateId = "template_y7uau0r";
    const userId = "_tWWKkHCqnW_moGJy";
    final res = await http.post(uri,
        headers: {'Content-Type': 'application/json','origin': 'http://localhost'},
        body: json.encode({
          "service_id": serviceId,
          "template_id" : templateId,
          "user_id" : userId,
          "template_params" : {
            "to_name": nameController.text,
            "subject" : "Thank you for your application to BMS",
            "message": "Congratulations! Your application for the role of Operator has been successfully received by BMS",
            "user_email" : idEmailController.text
          }
        })
    );print(res.statusCode);
    return res.statusCode;
  }

  Future<void> send() {
    return opResponse.add({
      'fname' : nameController.text,
      'areaname' : locationController.text,
      'contactno' : contactController.text,
      'email' : idEmailController.text,
      'status' : 'Pending',
      'desc' : " ",
    });
  }



  void signInUser (context) async{
      await FirebaseFirestore.instance.collection('collectionPath').doc('jUc1NdCqM3ZNZAQxFtUKj5WLWur1').snapshots().forEach((element) {
        if(element.data()?['uname'] == userController.text && element.data()?['pass'] == passwordController.text && element.data()?['role'] == dropdownvalue){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AdminHome()));
        }else if(element.data()?['uname'] == userController.text && element.data()?['pass'] == passwordController.text&& element.data()?['role'] == dropdownvalue){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OperatorHome()));
        }
      }).catchError((e){
      Navigator.pop(context);
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

    });
  }


  Future<void> testSign({required String email, required String password}) async{
    if(_formkey.currentState!.validate()){
      try{
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        UserManagemnt().authorizeAccess(context);
      } on FirebaseAuthException catch (e){
        AlertDialog alertDialog = AlertDialog(
          title: const Text('Erroe Message'),
          content: Text(e.message.toString()),
        );
        print(e.code);
      }
    }
  }
}
