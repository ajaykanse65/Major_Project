// ignore_for_file: use_build_context_synchronously

import 'package:bms/Utils/app_theme.dart';
import 'package:bms/Utils/loading_dialog.dart';
import 'package:bms/Utils/app_color.dart';
import 'package:bms/page/home.dart';
import 'dart:convert';
import 'package:bms/page/password.dart';
import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      darkTheme: AppTheme.light,
      // theme: ThemeData(
      //     primaryColor: Colors.deepOrangeAccent.shade200, fontFamily: "Ubuntu"),
      home: const LoginPage2(),
    );
  }
}




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
                  Container(
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
                            onPressed: () async{
                              userFocusNode.unfocus();
                              passwordFocusNode.unfocus();
                              showLoadingDialog(context);
                              await Future.delayed(const Duration(milliseconds:2000 ));

                              if(mounted) Navigator.pop(context);
                              login();
                              },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)
                              ),
                            ),
                            child: const Text("Login",
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        )
                      ],
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

  Future<void> login() async {
    const String apiUrl = 'https://androidtest.joogadnet.com/JoogadOperatorAppApi1/getData.php';
    if(userController.text.isEmpty && passwordController.text.isEmpty){
      trigFail?.change(true);
    }
    else if (userController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await http.post(Uri.parse(apiUrl),
          body: ({'action': 'loginChk', 'userName': userController.text, 'password': passwordController.text, 'FCM_TOKEN' : FCMtoken
          }));
      if (response.statusCode == 200) {
        var resData = jsonDecode(response.body);
        print(resData);
        String status = resData['Status'];
        if(status != 'Success'){
          trigFail?.change(true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              padding: const EdgeInsets.all(5),
              content: Text(
                status,
                style: const TextStyle(
                     fontSize: 15, letterSpacing: 0.5),
                textAlign: TextAlign.center,
              ),
              elevation: 6.0,
              behavior: SnackBarBehavior.floating,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          );
        }else{
          trigSuccess?.change(true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              padding: EdgeInsets.all(5),
              content: Text(
                'Login Successfully',
                style: TextStyle(
                     fontSize: 15, letterSpacing: 0.5),
                textAlign: TextAlign.center,
              ),
              elevation: 6.0,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          );
          final SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('loginId', resData['LOGIN_ID'] as String);
          preferences.setString('empId', resData['EMP_ID'] as String);
          preferences.setString('username', resData['USER_NAME'] as String);
          preferences.setString('level', resData['LEVEL'] as String);
          preferences.setString('mainnetwid', resData['MAIN_NETW_ID'] as String);
          preferences.setString('subnetwid', resData['SUB_NETW_ID'] as String);
          preferences.setString('shrtname', resData['NETW_SHRT_NAME'] as String);
          preferences.setString('loginId', resData['LOGIN_ID'] as String);
          preferences.setString('empId', resData['EMP_ID'] as String);
          preferences.setString('username', resData['USER_NAME'] as String);
          preferences.setString('level', resData['LEVEL'] as String);
          preferences.setString('mainnetwid', resData['MAIN_NETW_ID'] as String);
          preferences.setString('subnetwid', resData['SUB_NETW_ID'] as String);
          preferences.setString('shrtname', resData['NETW_SHRT_NAME'] as String);
          final String encodeList = jsonEncode(resData['menuList']);
          preferences.setString('menulist', encodeList);
          // Add Preferences Here

          Navigator.push(context, MaterialPageRoute(builder: (context) =>  const home()));
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          padding: EdgeInsets.all(5),
          content: Text(
            'All Field are Required',
            style: TextStyle(
                color: Colors.black, fontSize: 15, letterSpacing: 0.5),
            textAlign: TextAlign.center,
          ),
          elevation: 6.0,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      );
    }
  }

  Widget buildTextField(String hintText1, hintText2)  {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25),
      child: Column(
        children: [
          TextFormField(
            controller: userController,
            decoration: InputDecoration(
              hintText: hintText1,
              hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon:const Icon(Icons.verified_user)
                  // : const Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 25,),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: hintText2,
              hintStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: hintText2 == 'Password'
                ? IconButton(onPressed: _toggleVisibility, icon: _isHidden
                  ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility)
              )
              : null
            ),
            obscureText: hintText2 == "Password" ? _isHidden : false,
          ),
          // const SizedBox(height: 25,),
          // TextFormField( // Comment this code after login
          //     keyboardType: TextInputType.number,
          //     inputFormatters: <TextInputFormatter>[
          //       FilteringTextInputFormatter.digitsOnly
          //     ],
          //   controller: mnoController,
          //   decoration: InputDecoration(
          //       hintText: hintText3,
          //       hintStyle: const TextStyle(
          //         color: Colors.black,
          //         fontSize: 16.0,
          //       ),
          //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //       prefixIcon: const Icon(Icons.lock),)
          //   ), // Comment this code after login
        ],
      ),
    );
  }

  Widget buildButtonContainer() {
    return CustomButtonWidget(
        title: const Text(
          "LOGIN",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onPressed: () async {
          if (loading) return;
          setState(() => loading = true);
          await Future.delayed(const Duration(seconds: 1));
          login();
          setState(() => loading = false);
        },
        dimensionheight: 35,
        dimensionwidth: 100);
  }

  Widget buildButton() {
    return Container(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => password()));
        },
        child: const Text(
          "Update Password",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
