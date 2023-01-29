import 'package:flutter/material.dart';

class InstallationCardWidget extends StatefulWidget {
  const InstallationCardWidget({Key? key}) : super(key: key);

  @override
  State<InstallationCardWidget> createState() => _InstallationCardWidgetState();
}

class _InstallationCardWidgetState extends State<InstallationCardWidget> {
  TextEditingController helpcontroller = TextEditingController();
  TextEditingController othercontroller =TextEditingController();

  @override
  void dispose (){
    helpcontroller.dispose();
    othercontroller.dispose();
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

        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "INSTALLATION",
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
              Text('Wiring Helped By',style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: helpcontroller,
                  decoration: InputDecoration(
                    hintText: "Wiring Helped By",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text('Router Configured By (If Other)',style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: othercontroller,
                  decoration: InputDecoration(
                    hintText: "Router Configured By",
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
