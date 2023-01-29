import 'package:flutter/material.dart';

class AadharAddressCardWidget extends StatefulWidget {
  const AadharAddressCardWidget({Key? key}) : super(key: key);


  @override
  State<AadharAddressCardWidget> createState() => _AadharAddressCardWidgetState();
}

class _AadharAddressCardWidgetState extends State<AadharAddressCardWidget> {
  bool value = false;
  TextEditingController aadharaddcontroller = TextEditingController();
  @override
  void dispose(){
    aadharaddcontroller.dispose();
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
                'ADDRESS ON AADHAR / PASSPORt / DRIVING LICENSE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                endIndent: 10,
                color: Colors.black,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Addres on Aadhar / Passport / Driving License',
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 150,
                child: TextFormField(
                  validator: (value1){
                    if (value1 == null || value1.isEmpty){
                      return 'Please fill this field';
                    }
                    return null;
                  },
                  controller: aadharaddcontroller,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Addres on Aadhar / Passport / Driving License',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Same As Above",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,),),
                  SizedBox(width: 1,),
                  Checkbox(
                    focusColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    value: this.value,
                    onChanged: (bool? value) {
                      setState((){
                        this.value =  value!;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
