import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/custom_search_widget.dart';

void main() => runApp(topup());

class topup extends StatelessWidget {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10,),
              HeadlineWidget(bal: '5000'),
              Container(
                margin: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0, bottom: 0.0),
                alignment: Alignment.center,
                child: Card(
                  elevation: 20,
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Text('Testagent Network', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),),
                      SizedBox(height: 20.0,),
                      buildTextFeild("Amount"),
                      SizedBox(height: 20.0,),
                      buildText1Feild("Mobile number"),
                      SizedBox(height: 20.0,),
                      buildText2Feild("Email ID"),
                      SizedBox(height: 20.0,),
                      buildButton1Feild(),
                      SizedBox(height: 20.0,),
                      buildButtonFeild(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildTextFeild(String hintText){
    return Container(
      padding: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0, bottom: 5.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          prefixIcon: hintText == "Enter Amount" ? Icon(Icons.currency_rupee) : Icon(Icons.currency_rupee),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
  buildText1Feild(String hintText){
    return Container(
      padding: EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0, bottom: 5.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          prefixIcon: hintText == "Mobile Number" ? Icon(Icons.call) : Icon(Icons.call),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
  buildText2Feild(String hintText){
    return Container(
      padding: EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0, bottom: 5.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.0
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          prefixIcon: hintText == "Email Id" ? Icon(Icons.email) : Icon(Icons.email),
        ),
      ),
    );
  }
  buildButton1Feild(){
    return Container(
      padding: EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0, bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Checkbox(
            value: isChecked,
            onChanged: (bool? newValue){
              isChecked = newValue!;
            },
            checkColor: Colors.black,
            activeColor: Colors.deepOrange,
          ),
          Container(
            child: Text("Agree Pay", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
          )
        ],
      )
    );
  }
  buildButtonFeild(){
    return Container(
      padding: EdgeInsets.only(top: 5.0, right: 20.0, left: 20.0, bottom: 50.0),
      child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent),child: Text("Pay",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),),
    );
  }
}