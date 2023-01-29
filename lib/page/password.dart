import 'package:bms/Utils/maps_utils.dart';
import 'package:bms/widget/custom_button_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(password());

class password extends StatelessWidget {

  TextEditingController locontroler = TextEditingController();
  TextEditingController destcontroller = TextEditingController();

  void dispose(){
    locontroler.dispose();
    destcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Password'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0,),
              buildTextFeild("Current Password"),
              SizedBox(height: 10.0,),
              buildTextFeild1("New Password"),
              SizedBox(height: 10.0,),
              buildTextFeild2("Confirm Password"),
              SizedBox(height: 15.0,),
              Center(child: CustomButtonWidget(title: Text("Reset Password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),), onPressed: (){}, dimensionheight: 35, dimensionwidth: 140)),
              // Center(
              //   child: Column(
              //     children: [
              //       TextFormField(
              //         controller: locontroler,
              //
              //       ),
              //       // TextFormField(
              //       //   controller: destcontroller,
              //       //
              //       // ),
              //       IconButton(onPressed: (){
              //         MapUtils.openMap(locontroler.text,);
              //       }, icon: Icon(Icons.location_pin),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextFeild(String hintText){
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0
        ),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
      ),
        prefixIcon: hintText == "New Password" ? Icon(Icons.lock) : Icon(Icons.lock),
      ),
    );
  }
  Widget buildTextFeild1(String hintText){
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          prefixIcon: hintText == "New Password" ? Icon(Icons.lock) : Icon(Icons.lock),
      ),
    );
  }
  Widget buildTextFeild2(String hintText){
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        prefixIcon: hintText == "Confirm Password" ? Icon(Icons.lock) : Icon(Icons.lock),
      ),
    );
  }
 
}