

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactCardWidget extends StatefulWidget {
  const ContactCardWidget({Key? key}) : super(key: key);

  @override
  State<ContactCardWidget> createState() => _ContactCardWidgetState();
}

class _ContactCardWidgetState extends State<ContactCardWidget> {
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController phoenocontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();

  @override
  void dispose(){
   super.dispose();
    mobilecontroller.dispose();
    phoenocontroller.dispose();
    emailcontroller.dispose();
    addresscontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.deepOrangeAccent.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: EdgeInsets.all(15),
        height: 480,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CONTACT",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Divider(
                endIndent: 10,
                color: Colors.black,
              ),

              SizedBox(height: 20,),
              Text("Primary Mobile", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: mobilecontroller,
                  decoration: InputDecoration(
                    hintText: "Primary Mobile",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text("Phone", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: phoenocontroller,
                  decoration: InputDecoration(
                    hintText: "Phone",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text("Email", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text("Aadhar/DL/Passport", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'Please fill the field';
                    }
                    return null;
                  },
                  controller: addresscontroller,
                  decoration: InputDecoration(
                    hintText: "aadhar/DL/Passport",
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
    );
  }
}
