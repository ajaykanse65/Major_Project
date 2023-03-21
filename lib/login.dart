import 'package:bms/Utils/app_color.dart';
import 'package:bms/authentication.dart';
import 'package:bms/page/home.dart';
import 'package:bms/service/usermanagement.dart';
import 'package:flutter/material.dart';
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
  FocusNode userFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool loading =  false;
  String? FCMtoken = " ";
  String hintText2 = 'Password';


  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance.currentUser;


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
    FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        FCMtoken = token;
      });
      // savetoken(token!);
    });
  }

  @override
  void dispose() {
    userFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    super.dispose();
  }

  void emailFocus() {
    isChecking?.change(userFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  final _formkey = GlobalKey<FormState>();

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
                  const SizedBox(height: 32,),
                  Text("Welcome",
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  // const SizedBox(height: 100,),
                  // const Text('Bits \nManagement \nSystem',style: TextStyle(shadows: [
                  //   Shadow(
                  //     blurRadius:10.0,
                  //     color: Colors.white,
                  //     offset: Offset(2.5,2.5),
                  //   ),
                  // ], color: Colors.black,fontSize: 45,fontWeight: FontWeight.bold,fontFamily: "Ubuntu" ),),
                  // const SizedBox(height: 50,),
                  // buildTextField('User Name','Password'),
                  // const SizedBox(height: 20,),
                  // buildButtonContainer(),
                  // const SizedBox(height: 20,),
                  // buildButton(),
                  SizedBox(height: 300,width: 300,
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
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: TextFormField(
                              focusNode: userFocusNode,
                              controller: userController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.verified_user,color: Colors.black,),
                                  border: InputBorder.none,
                                  hintText: "User Name",
                                  hintStyle: TextStyle(color: Colors.black)
                              ),
                              style: Theme.of(context).textTheme.bodyMedium,
                              onChanged: (value){
                                numLook?.change(value.length.toDouble());
                              },
                            ),
                          ),
                          SizedBox(height: 8,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: TextFormField(
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
                              onChanged: (value){},
                            ),
                          ),
                          const SizedBox(height: 32,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 64,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)
                                ),
                              ),
                              onPressed: () async{
                                userFocusNode.unfocus();
                                passwordFocusNode.unfocus();
                                showLoadingDialog(context);
                                await Future.delayed(const Duration(milliseconds:2000 ));

                                if(mounted) Navigator.pop(context);
                                testSign(email: userController.text, password: passwordController.text);

                              },
                              child: const Text("Login",
                                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );


  }


  Future<void> testSign({required String email, required String password}) async{
    if(_formkey.currentState!.validate()){
      try{
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        UserManagemnt().authorizeAccess(context);
      } on FirebaseAuthException catch (e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()))
        );
      }
    }
  }




// Widget buildTextField(String hintText1, hintText2)  {
//   return Padding(
//     padding: const EdgeInsets.only(left: 25,right: 25),
//     child: Column(
//       children: [
//         TextFormField(
//           controller: userController,
//           decoration: InputDecoration(
//             hintText: hintText1,
//             hintStyle: const TextStyle(
//               color: Colors.black,
//               fontSize: 16.0,
//             ),
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
//             prefixIcon:const Icon(Icons.verified_user)
//                 // : const Icon(Icons.lock),
//           ),
//         ),
//         const SizedBox(height: 25,),
//         TextFormField(
//           controller: passwordController,
//           decoration: InputDecoration(
//             hintText: hintText2,
//             hintStyle: const TextStyle(
//               color: Colors.black,
//               fontSize: 16.0,
//             ),
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
//             prefixIcon: const Icon(Icons.lock),
//             suffixIcon: hintText2 == 'Password'
//               ? IconButton(onPressed: _toggleVisibility, icon: _isHidden
//                 ? const Icon(Icons.visibility_off)
//               : const Icon(Icons.visibility)
//             )
//             : null
//           ),
//           obscureText: hintText2 == "Password" ? _isHidden : false,
//         ),
//         // const SizedBox(height: 25,),
//         // TextFormField( // Comment this code after login
//         //     keyboardType: TextInputType.number,
//         //     inputFormatters: <TextInputFormatter>[
//         //       FilteringTextInputFormatter.digitsOnly
//         //     ],
//         //   controller: mnoController,
//         //   decoration: InputDecoration(
//         //       hintText: hintText3,
//         //       hintStyle: const TextStyle(
//         //         color: Colors.black,
//         //         fontSize: 16.0,
//         //       ),
//         //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
//         //       prefixIcon: const Icon(Icons.lock),)
//         //   ), // Comment this code after login
//       ],
//     ),
//   );
// }

// Widget buildButtonContainer() {
//   return CustomButtonWidget(
//       title: const Text(
//         "LOGIN",
//         style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
//       ),
//       onPressed: () async {
//         if (loading) return;
//         setState(() => loading = true);
//         await Future.delayed(const Duration(seconds: 1));
//         login();
//         setState(() => loading = false);
//       },
//       dimensionheight: 35,
//       dimensionwidth: 100);
// }
//
// Widget buildButton() {
//   return Container(
//     alignment: Alignment.bottomRight,
//     child: TextButton(
//       onPressed: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => password()));
//       },
//       child: const Text(
//         "Update Password",
//         style: TextStyle(
//             color: Colors.black,
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold),
//       ),
//     ),
//   );
// }
}