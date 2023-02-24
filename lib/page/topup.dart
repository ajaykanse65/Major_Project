import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/custom_search_widget.dart';

void main() => runApp(topup());

class topup extends StatefulWidget {
  @override
  State<topup> createState() => _topupState();
}

class _topupState extends State<topup> {
  bool isChecked = false;
  var amtController = TextEditingController();
  var mnoController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              HeadlineWidget(bal: '5000'),
              Container(
                margin: const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0, bottom: 0.0),
                alignment: Alignment.center,
                child: Card(
                  elevation: 20,
                  margin: EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0, bottom: 5.0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 10,),
                        const Text('Testagent Network', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),
                        const SizedBox(height: 20.0,),
                        TextFormField(
                          controller: amtController,
                          decoration: InputDecoration(
                            hintText: 'Enter Amount',
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            prefixIcon: const Icon(Icons.currency_rupee),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        const SizedBox(height: 20.0,),
                        TextFormField(
                          controller: mnoController,
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            prefixIcon: const Icon(Icons.call),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        const SizedBox(height: 20.0,),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email Id',
                            hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            prefixIcon: const Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        CheckboxListTile(
                          title: const Text("Agree Pay", style: TextStyle(fontWeight: FontWeight.bold),),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                        ),
                        const SizedBox(height: 20.0,),
                        ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),child: const Text("Pay",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),),
                      ],
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