import 'package:bms/widget/socialmedia_dropdown_widget.dart';
import 'package:flutter/material.dart';

class SoicalMediaCardWidegt extends StatelessWidget {
  TextEditingController profilecontroller = TextEditingController();
  @override
  void dispose(){
    profilecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 20,
      color: Colors.deepOrangeAccent.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SOCIAL MEDIA PROFILE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Divider(
                color: Colors.black,
                endIndent: 10,
              ),
              SizedBox(height: 20,),

              SocialDropDownWidget(),

              SizedBox(height: 20,),

              Container(
                height: 40,
                child: TextFormField(
                  controller: profilecontroller,
                  decoration: InputDecoration(
                    hintText: "Profile Link",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Row(
                children: [
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.blueAccent),child: Icon(Icons.add,size: 30,color: Colors.white,),),
                  SizedBox(width: 8,),
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.red),child: Icon(Icons.delete,size: 30,color: Colors.white,),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
