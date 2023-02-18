import 'package:bms/widget/aadhar_aadress_card.dart';
import 'package:bms/widget/address_card_widget.dart';
import 'package:bms/widget/billing_card_widget.dart';
import 'package:bms/widget/contact_card_widget.dart';
import 'package:bms/widget/credentials_card_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/doc_card_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/installation_card_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:bms/widget/personal_card_widget.dart';
import 'package:bms/widget/refundable_card_widget.dart';
import 'package:bms/widget/soicalmedia_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widget/usertype_dropdown_widget.dart';

class new_user extends StatefulWidget {
  const new_user({Key? key}) : super(key: key);

  @override
  State<new_user> createState() => _new_userState();
}

class _new_userState extends State<new_user> {
  String dropdownvalue = 'Individual';
  var items = ['Individual', 'Corporate'];
  var useridcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var fisrtnamecontroller = TextEditingController();
  var middlenamecontroller = TextEditingController();
  var lastnamecontroller = TextEditingController();
  var nationalitycontroller = TextEditingController();
  void dispose(){
    useridcontroller.dispose();
    passwordcontroller.dispose();
    fisrtnamecontroller.dispose();
    middlenamecontroller.dispose();
    lastnamecontroller.dispose();
    nationalitycontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              SizedBox(height: 10,),
              HeadlineWidget(bal: '5000'),
              SizedBox(height: 15,),
              Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadowColor: Colors.black,
              elevation: 20,
              color: Colors.deepOrangeAccent.shade100,
              child: Container(
                margin: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("CREDENTIALS",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,),),
                      Divider(
                        color: Colors.black,
                        endIndent: 10,
                      ),
                      SizedBox(height: 15,),
                      Text('User Type',style: TextStyle(color: Colors.black,fontSize: 18,),),
                      SizedBox(height: 10,),
                      Container(
                    height: 32,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                    ),
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
                      SizedBox(height: 20,),
                      Text("User Id",style: TextStyle(color: Colors.black,fontSize: 18,),),
                      SizedBox(height: 10,),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: (value1){
                            if (value1 == null || value1.isEmpty){
                              return 'Please fill this field';
                            }
                            return null;
                          },
                          controller: useridcontroller,
                          decoration: InputDecoration(
                            hintText: "User Id",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Password",style: TextStyle(color: Colors.black,fontSize: 18,),),
                      SizedBox(height: 10,),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: (value1){
                            if (value1 == null || value1.isEmpty){
                              return 'Please fill this field';
                            }
                            return null;
                          },
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
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
              // CredentialsCardWidget
              SizedBox(height: 5,),
              Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadowColor: Colors.black,
              elevation: 20,
              color: Colors.deepOrangeAccent.shade100,
              child: Container(
                margin: EdgeInsets.all(15),
                height: 452,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PERSONAL",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,),),
                      Divider(
                        color: Colors.black,
                        endIndent: 10,
                      ),
                      SizedBox(height: 15,),
                      Text("First Name",style: TextStyle(color: Colors.black,fontSize: 18,),),
                      SizedBox(height: 10,),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: (value1){
                            if (value1 == null || value1.isEmpty){
                              return 'Please fill this field';
                            }
                            return null;
                          },
                          controller: fisrtnamecontroller,
                          decoration: InputDecoration(
                            hintText: "First Name",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Middle Name",style: TextStyle(color: Colors.black,fontSize: 18,),),
                      SizedBox(height: 10,),
                      Container(
                        height: 40,
                        child: TextFormField(
                          controller: middlenamecontroller,
                          decoration: InputDecoration(
                            hintText: "Middle Name",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Last Name",style: TextStyle(color: Colors.black,fontSize: 18,),),
                      SizedBox(height: 10,),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: (value1){
                            if (value1 == null || value1.isEmpty){
                              return 'Please fill this field';
                            }
                            return null;
                          },
                          controller: lastnamecontroller,
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Nationality",style: TextStyle(color: Colors.black,fontSize: 18,),),
                      SizedBox(height: 10,),
                      Container(
                        height: 40,
                        child: TextFormField(
                          validator: (value1){
                            if (value1 == null || value1.isEmpty){
                              return 'Please fill this field';
                            }
                            return null;
                          },
                          controller: nationalitycontroller,
                          decoration: InputDecoration(
                            hintText: "Indian",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
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
              // PersonalCardWidget(),
              SizedBox(height: 5,),
              AddressCardWidget(),
              SizedBox(height: 5,),
              AadharAddressCardWidget(),
              SizedBox(height: 5,),
              ContactCardWidget(),
              SizedBox(height: 5,),
              BillingCardWidget(),
              SizedBox(height: 5,),
              InstallationCardWidget(),
              SizedBox(height: 5,),
              DocumentsCardWidget(),
              SizedBox(height: 5,),
              RefundableCardWidget(),
              SizedBox(height: 5,),
              SoicalMediaCardWidegt(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w800,),),),
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),child: Text("Reset",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w800,),),),
                  ElevatedButton(onPressed: (){ add();},style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w800,),),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  add() async{
    var res = await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        body: {"utype" : dropdownvalue,"username" : useridcontroller.text, "password" : passwordcontroller.text,
          'fname' : fisrtnamecontroller.text, 'mname' : middlenamecontroller.text, 'lname' : lastnamecontroller.text, 'nation' : nationalitycontroller.text,

        });
    print(res.body);
  }
}
