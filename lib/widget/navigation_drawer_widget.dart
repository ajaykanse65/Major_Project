import 'package:bms/Utils/colors.dart';
// import 'package:bms/page/employee.dart';
import 'package:bms/page/home.dart';
// import 'package:bms/page/home.dart';
import 'package:bms/page/network.dart';
// import 'package:bms/page/reminder.dart';
// import 'package:bms/page/renewal.dart';
// import 'package:bms/page/topup.dart';
// import 'package:bms/page/bank.dart';
// import 'package:bms/page/cm_invoice.dart';
// import 'package:bms/page/customer.dart';
// import 'package:bms/page/employee.dart';
// import 'package:bms/page/expense.dart';
// import 'package:bms/page/gst_report.dart';
// import 'package:bms/page/invoice.dart';
// import 'package:bms/page/isp_invoice.dart';
// import 'package:bms/page/network.dart';
// import 'package:bms/page/new_sale.dart';
// import 'package:bms/page/new_user.dart';
// import 'package:bms/page/onusers.dart';
// import 'package:bms/page/plans.dart';
// import 'package:bms/page/product.dart';
// import 'package:bms/page/purchase.dart';
// import 'package:bms/page/quotation.dart';
// import 'package:bms/page/receipts.dart';
// import 'package:bms/page/renewal.dart';
// import 'package:bms/page/report.dart';
// import 'package:bms/page/task_manager.dart';
// import 'package:bms/page/topup.dart';
// import 'package:bms/page/utilization.dart';
// import 'package:bms/page/vendor.dart';
import 'package:flutter/material.dart';

import '../page/topup.dart';

class MultilevelDrawerWidget extends StatefulWidget {
  const MultilevelDrawerWidget({Key? key}) : super(key: key);

  @override
  State<MultilevelDrawerWidget> createState() => _MultilevelDrawerWidgetState();
}

class _MultilevelDrawerWidgetState extends State<MultilevelDrawerWidget> {
  List<String> _menu = ["DashBoard","Top-Up","Network"];



  bool isLoading = false;
  // final padding = EdgeInsets.symmetric(horizontal: 10);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        // decoration:
        // const BoxDecoration(gradient: LinearGradient(colors: cardcolor)),
        width: 200,
        child: Column(
            children:  [
              DrawerHeader(
                decoration:
                BoxDecoration(gradient: LinearGradient(colors: cardcolor)),
                child: Center(
                  child: Text(
                    "Bits \nManagement \nSystem",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: _menu.map((menu) {
                    return ListTile(
                      title: Text(menu,style:const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      onTap: (){
                        if(menu == 'Network'){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Network()));
                        }else if(menu == "Top-Up"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => topup()));
                        }else if(menu == "DashBoard"){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
              // Expanded(
              //     // child: ListView.builder(
              //     //     itemCount: 10,
              //     //     itemBuilder: (_, index){
              //     //       return ListTile(
              //     //         title: Text("Data $index"),
              //     //         onTap: (){
              //     //           if (index == 1){
              //     //             Navigator.push(context, MaterialPageRoute(builder: (context) => topup()));
              //     //           }
              //     //         },
              //     //       );
              //     //     })
              // ),
              // ListTile(
              //   title: Text("data"),
              // ),
              // ListView.builder(
              //     itemCount: 10,
              //     itemBuilder: (_, index){
              //       return ListTile(
              //         title: Text("Data $index"),
              //       );
              //     }),
              // ListView.builder(
              //   itemBuilder: (BuildContext context, int index) {
              //     return ListTile(
              //         title: const Text(
              //           "Dashboard",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         leading: const Icon(Icons.home),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(context,
              //               MaterialPageRoute(builder: (context) => const home()));
              //         });
              //   },
              // ),
              // const Divider(
              //   color: Colors.black,
              // ),
              // ExpansionTile(
              //   title: const Text(
              //     "Sales",
              //     style: TextStyle(
              //         color: Colors.black, fontWeight: FontWeight.bold),
              //   ),
              //   leading: const Icon(Icons.production_quantity_limits),
              //   trailing: const Icon(Icons.arrow_right),
              //   children: [
              //     ListTile(
              //         title: const Text(
              //           "New Sales",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => new_sale()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Utilization",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => uitilizationn()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Quotation",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => quotation()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Purchase",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => purchase()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Expense",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(context,
              //               MaterialPageRoute(builder: (context) => expense()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Bank",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const bank()));
              //         })
              //   ],
              // ),
              // const Divider(
              //   color: Colors.black,
              // ),
              // ExpansionTile(
              //   title: const Text(
              //     "Users",
              //     style: TextStyle(
              //         color: Colors.black, fontWeight: FontWeight.bold),
              //   ),
              //   leading: const Icon(Icons.person),
              //   trailing: const Icon(Icons.arrow_right),
              //   children: [
              //     ListTile(
              //         title: const Text(
              //           "New Users",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const new_user()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Task Manager",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const TaskManager()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "User Info. Renewal",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const renewal()));
              //           //           trailing: Icon(Icons.arrow_right),)
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Online Users",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => on_users()));
              //         })
              //   ],
              // ),
              // const Divider(
              //   color: Colors.black,
              // ),
              // ExpansionTile(
              //   title: const Text(
              //     "Service",
              //     style: TextStyle(
              //         color: Colors.black, fontWeight: FontWeight.bold),
              //   ),
              //   leading: const Icon(Icons.miscellaneous_services),
              //   trailing: const Icon(Icons.arrow_right),
              //   children: [
              //     ListTile(
              //         title: const Text(
              //           "Customer",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => customer()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Vendor",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(context,
              //               MaterialPageRoute(builder: (context) => vendor()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Product",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => Product1()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Plans",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(context,
              //               MaterialPageRoute(builder: (context) => plans()));
              //         })
              //   ],
              // ),
              // const Divider(
              //   color: Colors.black,
              // ),
              // ExpansionTile(
              //   title: const Text(
              //     "Invoice",
              //     style: TextStyle(
              //         color: Colors.black, fontWeight: FontWeight.bold),
              //   ),
              //   leading: const Icon(Icons.print),
              //   trailing: const Icon(Icons.arrow_right),
              //   children: [
              //     ListTile(
              //         title: const Text(
              //           "Invoice",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(context,
              //               MaterialPageRoute(builder: (context) => invoice()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "ISP Invoice",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => isp_invoice()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Commission Invoice",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const cm_invoice()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "Receipts",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => receipts()));
              //         })
              //   ],
              // ),
              // const Divider(
              //   color: Colors.black,
              // ),
              // ListTile(
              //     title: const Text(
              //       "Online Topup",
              //       style: TextStyle(
              //           color: Colors.black, fontWeight: FontWeight.bold),
              //     ),
              //     leading: const Icon(Icons.currency_rupee),
              //     onTap: () {
              //       Navigator.pop(context);
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => topup()));
              //     }),
              // ListTile(
              //     title: const Text(
              //       "Employee",
              //       style: TextStyle(
              //           color: Colors.black, fontWeight: FontWeight.bold),
              //     ),
              //     leading: const Icon(Icons.person),
              //     onTap: () {
              //       Navigator.pop(context);
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => emp()));
              //     }),
              // ListTile(
              //     title: const Text(
              //       "View Network",
              //       style: TextStyle(
              //           color: Colors.black, fontWeight: FontWeight.bold),
              //     ),
              //     leading: const Icon(Icons.network_check_sharp),
              //     onTap: () {
              //       Navigator.pop(context);
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => const Network()));
              //     }),
              // ExpansionTile(
              //   title: const Text(
              //     "Report",
              //     style: TextStyle(
              //         color: Colors.black, fontWeight: FontWeight.bold),
              //   ),
              //   leading: const Icon(Icons.file_copy_rounded),
              //   trailing: const Icon(Icons.arrow_right),
              //   children: [
              //     ListTile(
              //         title: const Text(
              //           "Report",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const report()));
              //         }),
              //     ListTile(
              //         title: const Text(
              //           "GST Report",
              //           style: TextStyle(
              //               color: Colors.black, fontWeight: FontWeight.bold),
              //         ),
              //         onTap: () {
              //           Navigator.pop(context);
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => gst_report()));
              //         })
              //   ],
              // ),
            ],
          ),
      )
    );
  }

  // Widget test(){
  //   return ListView.builder(itemBuilder: (context,index){
  //     return ListTile(
  //       tileColor: Colors.black,
  //       title: Text(_menu[index]),
  //       onTap: (){
  //         if(_menu == 'DashBoard'){
  //           Navigator.push(context, MaterialPageRoute(builder: (context) => Network()));
  //         }if(_menu == 'Top-UP'){
  //           Navigator.push(context, MaterialPageRoute(builder: (context) => reminder()));
  //         }
  //       },
  //     );
  //   });
  // }
  //
  //
  // List<dynamic> Menudata(){
  //   return _menu.map((menudata) => ListTile(
  //     title: Text(menudata),
  //   )).toList();
  // }

  // ListView getBody(BuildContext context){
  //   return ListView.builder(
  //     itemCount: 10,
  //       itemBuilder: (_, index){
  //         return ListTile(
  //           title: Text("Data $index"),
  //     );
  //   });
  // }

  // Widget getBody() {
  //   if(data.contains(null) || data.length < 0 || isLoading){
  //     return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),));
  //   }
  //   return ListView.builder(
  //       itemCount: data.length,
  //       itemBuilder: (context, index) {
  //         return localdrawe(data[index]);
  //       });
  // }

  // Widget localdrawe (index){
  //   return ListView.builder(
  //     itemBuilder: (BuildContext context, int index) {
  //       return ListTile(
  //           title: const Text(
  //             "Dashboard",
  //             style: TextStyle(
  //                 color: Colors.black, fontWeight: FontWeight.bold),
  //           ),
  //           leading: const Icon(Icons.home),
  //           onTap: () {
  //             Navigator.pop(context);
  //             Navigator.push(context,
  //                 MaterialPageRoute(builder: (context) => const home()));
  //           });
  //     },
  //   );
  // }
}

Widget buildSearchField() {
  const color = Colors.black;

  return TextField(
    style: const TextStyle(color: color),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: 'Search',
      hintStyle: const TextStyle(color: color),
      prefixIcon: const Icon(Icons.search, color: color),
      filled: true,
      fillColor: Colors.white38,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color.withOpacity(0.7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color.withOpacity(0.7)),
      ),
    ),
  );
}
