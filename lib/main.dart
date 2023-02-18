import 'dart:convert';

import 'package:bms/page/home.dart';
import 'package:bms/page/password.dart';
import 'package:bms/widget/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
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
  var mnoController = TextEditingController();
  bool loading =  false;

  bool _isHidden = true;
  var items = ['Admin','Operator','emp'];

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent.shade200,
      // backgroundColor: Colors.deepOrangeAccent.shade200,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100,),
              const Text('Bits \nManagement \nSystem',style: TextStyle(shadows: [
                Shadow(
                  blurRadius:10.0,
                  color: Colors.white,
                  offset: Offset(2.5,2.5),
                ),
              ], color: Colors.black,fontSize: 45,fontWeight: FontWeight.bold,fontFamily: "Ubuntu" ),),
              const SizedBox(height: 50,),
              buildTextField('User Name','Password','Mobile No'),
              const SizedBox(height: 20,),
              buildButtonContainer(),
              const SizedBox(height: 20,),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    const String apiUrl = 'https://androidtest.joogadnet.com/androidAppApi/getData.php';
    if (userController.text.isNotEmpty &&
        passwordController.text.isNotEmpty && mnoController.text.isNotEmpty) {
      var response = await http.post(Uri.parse(apiUrl),
          body: ({'action': 'loginChk', 'userName': userController.text, 'password': passwordController.text, 'mobileNo' : mnoController.text
          }));
      if (response.statusCode == 200) {
        print(response.body);
        var resData = json.decode(response.body);
        String Status = resData['Status'];
        if(Status != 'Success'){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              padding: const EdgeInsets.all(5),
              content: Text(
                Status,
                style: const TextStyle(
                     fontSize: 15, letterSpacing: 0.5),
                textAlign: TextAlign.center,
              ),
              elevation: 6.0,
              backgroundColor: Colors.grey,
              behavior: SnackBarBehavior.floating,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          );
        }else{
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
          // SharedPreferences preferences = await SharedPreferences.getInstance();
          // Add Preferences Here
          Navigator.push(context, MaterialPageRoute(builder: (context) => const home()));
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

  Widget buildTextField(String hintText1, hintText2, hintText3) {
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
          const SizedBox(height: 25,),
          TextFormField( // Comment this code after login
            controller: mnoController,
            decoration: InputDecoration(
                hintText: hintText3,
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                prefixIcon: const Icon(Icons.lock),)
            ), // Comment this code after login
        ],
      ),
    );
  }

  Widget buildButtonContainer() {
    return CustomButtonWidget(
        title: const Text(
          "LOGIN",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          if (loading) return;
          setState(() => loading = true);
          await Future.delayed(const Duration(seconds: 2));
          // login();
          Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
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
