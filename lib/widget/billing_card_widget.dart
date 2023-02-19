import 'package:flutter/material.dart';

class BillingCardWidget extends StatefulWidget {
  const BillingCardWidget({Key? key}) : super(key: key);

  @override
  State<BillingCardWidget> createState() => _BillingCardWidgetState();
}

class _BillingCardWidgetState extends State<BillingCardWidget> {
  TextEditingController pancontroller = TextEditingController();
  TextEditingController gstncontroller = TextEditingController();
  TextEditingController billingnamecontroller = TextEditingController();
  @override
  void dsipose() {
    super.dispose();
    billingnamecontroller.dispose();
    pancontroller.dispose();
    gstncontroller.dispose();
  }

  bool value = false;
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
                "Billing",
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Billing Name",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                child: TextFormField(
                  controller: billingnamecontroller,
                  decoration: InputDecoration(
                    hintText: "District",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    focusColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    value: this.value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  Text(
                    "Same As Above Name",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),
              Text("PAN Number", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: pancontroller,
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
              Text("GSTN Number", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: gstncontroller,
                  decoration: InputDecoration(
                    hintText: "District",
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
