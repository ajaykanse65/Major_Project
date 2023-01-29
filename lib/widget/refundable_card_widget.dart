import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RefundableCardWidget extends StatefulWidget {
  const RefundableCardWidget({Key? key}) : super(key: key);

  @override
  State<RefundableCardWidget> createState() => _RefundableCardWidgetState();
}

class _RefundableCardWidgetState extends State<RefundableCardWidget> {
  TextEditingController desccontroller = TextEditingController();
  TextEditingController amtcontroller = TextEditingController();
  TextEditingController totalamtcontroller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    desccontroller.dispose();
    amtcontroller.dispose();
    totalamtcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 20,
      shadowColor: Colors.black,
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
                "REFUNDABLE DEPOSITE",
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
              Text("Description", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: desccontroller,
                  decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text("Amount", style:TextStyle(
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
                  controller: amtcontroller,
                  decoration: InputDecoration(
                    hintText: "Amount",
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              
              Row(
                children: [
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.blueAccent),child: Icon(Icons.add,size: 30,color: Colors.white,),),
                  SizedBox(width: 8,),
                  ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.red),child: Icon(Icons.delete,size: 30,color: Colors.white,),),
                ],
              ),

              SizedBox(height: 20,),
              Text("Total Amount", style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),),
              SizedBox(height: 10,),
              Container(
                height: 40,
                child: TextFormField(
                  controller: amtcontroller,
                  decoration: InputDecoration(
                    hintText: "0",
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
