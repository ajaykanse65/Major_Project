import 'package:bms/widget/usertype_dropdown_widget.dart';
import 'package:flutter/material.dart';
class CredentialsCardWidget extends StatelessWidget {
  var useridcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  @override
  void dispose(){
    useridcontroller.dispose();
    passwordcontroller.dispose();
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
        height: 350,
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
              UserTypeDropDownWidget(),
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
    );
  }
}
