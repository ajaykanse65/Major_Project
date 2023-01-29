import 'package:bms/page/reminder.dart';
import 'package:bms/widget/cash_dropdown_widget.dart';
import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/datepicker_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:bms/widget/signle_date_picer.dart';
import 'package:bms/widget/total_count_widget.dart';
import 'package:flutter/material.dart';

class expense extends StatelessWidget {
  var expensecontroller = TextEditingController();
  var amtcontroller = TextEditingController();
  var desccontroller = TextEditingController();
  @override
  void dispose() {
    expensecontroller.dispose();
    amtcontroller.dispose();
    desccontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
      body: Container(
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
                height: 10,
              ),
              Text(
                'Date',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SingleDatePicker(),
              SizedBox(
                height: 5,
              ),
              Text(
                'Expense Name',
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
                  controller: expensecontroller,
                  decoration: InputDecoration(
                    hintText: 'Expense Name',
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
                'Mode',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              CashDropDownWidget(),
              SizedBox(
                height: 5,
              ),
              Text(
                "Amount",
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
                  controller: amtcontroller,
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
                'Description',
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
                  controller: desccontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(title: Text("Save",style: TextStyle(color: Colors.white,fontSize: 20),), onPressed: (){}, dimensionheight: 35, dimensionwidth: 110),
                  CustomButtonWidget(title: Text("Clear",style: TextStyle(color: Colors.white,fontSize: 20),), onPressed: (){}, dimensionheight: 35, dimensionwidth: 110),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text("Start Date",style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),),
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
                          Text("End Date",style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),),
                          SingleDatePicker()
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 5,),
              TotalCountWidget(title: 'Total Expense:', count: '100'),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: buildSearchField(),
              ),
              SizedBox(
                height: 10.0,
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
                  "Exp.Name",
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
                  DataCell(Text("product")),
                  DataCell(Text("product details")),
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
