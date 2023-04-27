
import 'package:bms/widget/custom_search_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CreatePayment extends StatefulWidget {
  const CreatePayment({Key? key}) : super(key: key);

  @override
  State<CreatePayment> createState() => _CreatePaymentState();
}

class _CreatePaymentState extends State<CreatePayment> {
  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controller = TextEditingController();
  Razorpay? _razorpay = Razorpay();
  String? paymentID;
  var total;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS PAYMENT: ${response.paymentId}", timeInSecForIosWeb: 4);
    setState(() {
      total = int.parse(test['bal'].toString()) + int.parse(_controller.text);
      _updateBalance();
      _fetchBalance();
    });
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR HERE: ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }
  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET IS : ${response.walletName}",
        timeInSecForIosWeb: 4);
  }
   String? _selectedValue;
  List<String> _options = [];
  var test;
  var bal,id;

  void _fetchOptions() async {
    final snapshot = await FirebaseFirestore.instance.collection('collectionPath').get();
    final options = snapshot.docs.map((doc) => doc.data()['billing'] as String).toList();
    // print(options);
    setState(() {
      _options = options;
    });
  }
  void _fetchBalance() async {
    final snapshot = await FirebaseFirestore.instance.collection('collectionPath')
    .where('billing', isEqualTo: _selectedValue.toString()).get().then((QuerySnapshot snapshot) {
      for (var element in snapshot.docs) {
        // print(element.data());
        setState(() {
          test = element.data();

        });
      }
    });
    // print(options);
  }
  void _updateBalance() async{
    final snapshot = await FirebaseFirestore.instance.collection('collectionPath')
        .doc(test['id'].toString())
        .update({
      'bal' : int.parse(total.toString())
    }).then((v) => debugPrint('success'))
        .catchError((e) => debugPrint(e));
  }
  @override
  void initState() {
    super.initState();
    _fetchOptions();
    print(DateTime.now());
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }
  @override
  void dispose() {
    super.dispose();
    _razorpay?.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 223, 1),
      extendBody: true,
      appBar: SearchBar(titile: 'Top up'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0, bottom: 0.0),
                    alignment: Alignment.center,
                    child: Card(
                      color: Color(0xFF607894),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 20,
                      margin: EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0, bottom: 5.0),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 10,),
                            const Text('BMS Network', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),),
                            const SizedBox(height: 20.0,),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(25.0)
                              ),
                              child: DropdownButton(
                            icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                            value: _selectedValue,
                            items: _options.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 120),
                                    child: Text(value,style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                                  ),
                                );
                            }).toList(),
                            onChanged: (value) {
                                setState(() {
                                  _selectedValue = value as String?;
                                  _fetchBalance();
                                  bal = test['bal'];
                                  id= test['id'];
                                  print(test['id'].toString());
                                  // print(id.toString());
                                });

                            },
                          ),

                            ),
                            // TextFormField(
                            //   // controller: amtController,
                            //   decoration: InputDecoration(
                            //     hintText: 'Enter Amount',
                            //     hintStyle: const TextStyle(
                            //         color: Colors.grey,
                            //         fontSize: 16.0
                            //     ),
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(25.0),
                            //     ),
                            //     prefixIcon: const Icon(Icons.currency_rupee),
                            //   ),
                            //   keyboardType: TextInputType.number,
                            //   inputFormatters: <TextInputFormatter>[
                            //     FilteringTextInputFormatter.digitsOnly
                            //   ],
                            // ),
                            const SizedBox(height: 10.0,),
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Text("Current Balance: ${test['bal'] }",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            
                            // TextFormField(
                            //   // controller: mnoController,
                            //   decoration: InputDecoration(
                            //     hintText: 'Mobile Number',
                            //     hintStyle: const TextStyle(
                            //         color: Colors.grey,
                            //         fontSize: 16.0
                            //     ),
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(25.0),
                            //     ),
                            //     prefixIcon: const Icon(Icons.call),
                            //   ),
                            //   keyboardType: TextInputType.number,
                            //   inputFormatters: <TextInputFormatter>[
                            //     FilteringTextInputFormatter.digitsOnly
                            //   ],
                            // ),

                            const SizedBox(height: 20.0,),
                            TextFormField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'Enter amount',
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
                            ElevatedButton(onPressed: (){
                              openPaymentPortal();
                            },style: ElevatedButton.styleFrom(backgroundColor: Colors.white),child: const Text("Pay",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.all(20),
                  //   child: TextField(
                  //     controller: _controller,
                  //     keyboardType: TextInputType.number,
                  //     inputFormatters: <TextInputFormatter>[
                  //       FilteringTextInputFormatter.digitsOnly
                  //     ],
                  //     decoration: InputDecoration(
                  //
                  //       prefixIcon: const Icon(Icons.currency_rupee),
                  //       hintText: "Enter payable amount",
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(12)),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 20),
                  //   width: double.infinity,
                  //   height: 50,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       FocusScope.of(context).requestFocus(FocusNode());
                  //       String amount = _controller.text.trim();
                  //       if (amount.isEmpty) {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           const SnackBar(
                  //             content: Text("Enter amount"),
                  //           ),
                  //         );
                  //         return;
                  //       }
                  //       openPaymentPortal();
                  //       // print(_controller.text.);
                  //     },
                  //     child: const Text("Pay"),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void openPaymentPortal() async {
    var options = {
      'key': 'rzp_test_YjOu38M2dxdNJ5',
      'amount': int.parse(_controller.text) * 100,
      'name': 'jhon',
      'description': 'Payment',
      'prefill': {'contact': '9999999999', 'email': 'jhon@razorpay.com'},
      // 'external': {
      //   'wallets': ['paytm']
      // }
    };
    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}


