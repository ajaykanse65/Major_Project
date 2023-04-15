import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/custom_button_widget.dart';
import '../widget/custom_search_widget.dart';
import '../widget/headline_widget.dart';
import '../widget/navigation_drawer_widget.dart';
import '../widget/signle_date_picer.dart';
import '../widget/transaction_type_dropdown.dart';


class bank extends StatefulWidget {
  const bank({Key? key}) : super(key: key);

  @override
  State<bank> createState() => _bankState();
}

class _bankState extends State<bank> with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  var accountnamecontroller = TextEditingController();
  var banknamecontroller = TextEditingController();
  var accnocontroller = TextEditingController();
  var accountbalcontroller = TextEditingController();

  @override
  void dispose() {
  accnocontroller.dispose();
  banknamecontroller.dispose();
  accountnamecontroller.dispose();
  accountbalcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
              icon: Icons.local_atm,
              iconColor: Colors.black,
              title: 'View Bank',
              titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: Color(0xff8DCBFA),
              onPress: () {
                _animationController!.reverse();
              }),
          Bubble(
              icon: Icons.payment,
              iconColor: Colors.black,
              title: 'Pay Mode',
              titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: Color(0xfff0ad4e),
              onPress: () {
                _animationController!.reverse();
              }),
          Bubble(
              icon: Icons.add,
              iconColor: Colors.black,
              title: 'Adjustment',
              titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: Color(0xff26B99A),
              onPress: () {
                _animationController!.reverse();
              }),
          Bubble(
              icon: Icons.currency_rupee,
              iconColor: Colors.black,
              title: 'Bank to Bank',
              titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: Color(0xff3498db),
              onPress: () {
                _animationController!.reverse();
              }),
          Bubble(
              icon: Icons.newspaper,
              iconColor: Colors.black,
              title: 'Cheque',
              titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: Color(0xff26B99A),
              onPress: () {
                _animationController!.reverse();
              }),
          Bubble(
              icon: Icons.currency_rupee,
              iconColor: Colors.black,
              title: 'Cash',
              titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: Color(0xff3498db),
              onPress: () {
                _animationController!.reverse();
              }),
        ],

        animation: _animation!,
        onPress: () => _animationController!.isCompleted
            ? _animationController!.reverse()
            : _animationController!.forward(),
        backGroundColor: Theme.of(context).primaryColor,
        iconColor: Colors.white,
        iconData: Icons.menu,
      ),
      appBar: SearchBar(titile: '',),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              HeadlineWidget(bal: '5000'),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Column(
                        children: [
                          Text(
                            "Start Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SingleDatePicker()
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Text(
                            "End Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SingleDatePicker()
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Account Name",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            TransactionDropDown()
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Transaction Type",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            TransactionDropDown()
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Outward",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            TransactionDropDown()
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),

              Text(
                'Account Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 40,
                child: TextField(
                  controller: accountnamecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Bank Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 40,
                child: TextField(
                  controller: banknamecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),
              Text(
                'Account Number',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: accnocontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Account Balance',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: accountbalcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CustomButtonWidget(
                  title: Text(
                    "Print",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {},
                  dimensionheight: 35,
                  dimensionwidth: 110),
              SizedBox(
                height: 15.0,
              ),
              buildDataTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDataTable() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child:
              DataTable(columnSpacing: 12, horizontalMargin: 12, columns: [
                DataColumn(
                    label: Text(
                      "Cr NO",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
                DataColumn(
                    label: Text(
                      "Date",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
                DataColumn(
                    label: Text(
                      "Type",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
                DataColumn(
                    label: Text(
                      "Details",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
                DataColumn(
                    label: Text(
                      "Amount",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
                DataColumn(
                    label: Text(
                      "Action",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
              ], rows: <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(Text("1")),
                  DataCell(Text("04/06/2022")),
                  DataCell(Text("Saving")),
                  DataCell(Text("bank details")),
                  DataCell(Text("0")),
                  DataCell(Container(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.print, color: Colors.blue)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, color: Colors.green)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete, color: Colors.red))
                      ],
                    ),
                  )),
                ]),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
