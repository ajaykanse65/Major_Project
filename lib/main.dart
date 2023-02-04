import 'package:bms/page/home.dart';
import 'package:bms/page/password.dart';
import 'package:bms/widget/custom_button_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrangeAccent.shade200, fontFamily: "Ubuntu"),
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
  bool _isHidden = true;
  String roleValue = 'Admin';
  var items = ['Admin','Operator','emp'];

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
              buildTextField('User Name'),
              const SizedBox(height: 25,),
              buildTextField('Password'),
              // const SizedBox(height: 20,),
              // buildRole(),
              const SizedBox(height: 20,),
              buildButtonContainer(),
              const SizedBox(height: 20,),
              buildButton(),
            ],
          ),
          // child: Container(
          //   decoration: const BoxDecoration(
          //       gradient: LinearGradient(colors: cardcolor)),
          //   // padding:
          //   //     EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
          //   child: Center(
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: <Widget>[
          //         SizedBox(
          //           height: 75,
          //         ),
          //         Text(
          //           'BMS Network Portal',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //               fontSize: 40.0,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white),
          //         ),
          //         SizedBox(
          //           height: 40.0,
          //         ),
          //         Text(
          //           "Login Form",
          //           style: TextStyle(
          //               fontSize: 32.0,
          //               fontWeight: FontWeight.bold,
          //               color: Theme.of(context).primaryColor),
          //         ),
          //         SizedBox(
          //           height: 50.0,
          //         ),
          //         buildTextField("User Name"),
          //         SizedBox(
          //           height: 28.0,
          //         ),
          //         buildTextField("Password"),
          //         SizedBox(height: 50.0),
          //         buildButtonContainer(),
          //         SizedBox(
          //           height: 10.0,
          //         ),
          //         buildButton(),
          //         SizedBox(
          //           height: 10.0,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25),
      child: TextField(
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: hintText == "User Name"
              ? const Icon(Icons.verified_user)
              : const Icon(Icons.lock),
          suffixIcon: hintText == "Password"
              ? IconButton(
                  onPressed: _toggleVisibility,
                  icon: _isHidden
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                )
              : null,
        ),
        obscureText: hintText == "Password" ? _isHidden : false,
      ),
    );
  }
  Widget buildRole(){
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30),
      child: Container(
        height: 35,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FittedBox(
          child: DropdownButton(
            value: roleValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items,style: const TextStyle(
                    color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                roleValue = newValue!;
              });
            },
          ),
        )
      ),
    );
  }

  Widget buildButtonContainer() {
    return CustomButtonWidget(
        title: const Text(
          "LOGIN",
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const home(),
            ),
          );
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
