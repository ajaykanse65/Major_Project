import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressCardWidget extends StatefulWidget {
  const AddressCardWidget({Key? key}) : super(key: key);

  @override
  State<AddressCardWidget> createState() => _AddressCardWidgetState();
}

class _AddressCardWidgetState extends State<AddressCardWidget> {
  TextEditingController distrctcontroller = TextEditingController();
  TextEditingController talukacontroller = TextEditingController();
  TextEditingController pincontroller = TextEditingController();
  TextEditingController areatcontroller = TextEditingController();
  TextEditingController landmarkctcontroller = TextEditingController();
  TextEditingController lanectcontroller = TextEditingController();
  TextEditingController roomctcontroller = TextEditingController();
  TextEditingController onuctcontroller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    distrctcontroller.dispose();
    talukacontroller.dispose();
    pincontroller.dispose();
    areatcontroller.dispose();
    landmarkctcontroller.dispose();
    lanectcontroller.dispose();
    roomctcontroller.dispose();
    onuctcontroller.dispose();
  }



  late String countryValue;
  late String stateValue;
  late String cityValue;

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
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "INSTALLATION ADDRESS",
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

              SizedBox(
                height: 15,
              ),
              SelectState(
                dropdownColor: Colors.white,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value;
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = value;
                  });
                },
              ),

              SizedBox(height: 20,),
              Text("District", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: distrctcontroller,
                  decoration: InputDecoration(
                    hintText: "District",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text("Taluka", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: talukacontroller,
                  decoration: InputDecoration(
                    hintText: "Taluka",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text("Pin Code", style:TextStyle(
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
                  controller: pincontroller,
                  decoration: InputDecoration(
                    hintText: "Pin Code",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text("Area Name", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: areatcontroller,
                  decoration: InputDecoration(
                    hintText: "Area Name",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text("Landmark", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: lanectcontroller,
                  decoration: InputDecoration(
                    hintText: "Land Mark",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text("Lane/CHS/Building", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: lanectcontroller,
                  decoration: InputDecoration(
                    hintText: "Lane/CHS/Building",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text("Room No. / Details Address", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: roomctcontroller,
                  decoration: InputDecoration(
                    hintText: "Details Address",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text("Connected ONU", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: onuctcontroller,
                  decoration: InputDecoration(
                    hintText: "Connected ONU",
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
