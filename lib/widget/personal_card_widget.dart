import 'package:bms/page/vendor.dart';
import 'package:flutter/material.dart';

class PersonalCardWidget extends StatelessWidget {

  var fisrtnamecontroller = TextEditingController();
  var middlenamecontroller = TextEditingController();
  var lastnamecontroller = TextEditingController();
  var nationalitycontroller = TextEditingController();

  @override
  void dispose (){
    fisrtnamecontroller.dispose();
    middlenamecontroller.dispose();
    lastnamecontroller.dispose();
    nationalitycontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
