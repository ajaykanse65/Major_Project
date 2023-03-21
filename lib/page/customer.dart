import 'package:bms/page/reminder.dart';
import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/page/home.dart';
import 'package:bms/widget/total_count_widget.dart';
import 'package:flutter/material.dart';

import '../main.dart';

void main() => runApp(customer());

class customer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(backgroundColor:Theme.of(context).primaryColor,onPressed: (){},label: Text("New Customer",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),),elevation: 15,),

      appBar: SearchBar(titile: '',),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            HeadlineWidget(bal: '5000'),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: buildSearchField(),
            ),
            SizedBox(height: 10,),
            TotalCountWidget(title: 'Total Customer', count: '1'),
            SizedBox(height: 10.0,),
            buildDataTable(),
          ],
        ),
      ),
    );
  }


  Widget buildSearchFeild() {
    return TextField(
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
                border:  Border.all(),
              ),
              child: DataTable(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  columns: [
                    DataColumn(label: Text("Cr No.", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),)),
                    DataColumn(label: Text("Customer Name", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),)),
                    DataColumn(label: Text("Due Amount", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),)),
                    DataColumn(label: Text("City Name", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),)),
                    DataColumn(label: Text("Phone", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),)),
                    DataColumn(label: Text("GSTN", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),)),
                    DataColumn(label: Text("Action", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),)),
                  ], rows: <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(Text("1")),
                  DataCell(Text("Omkar Internmet")),
                  DataCell(Text("1500")),
                  DataCell(Text("Mumbai")),
                  DataCell(Text("APOSE37RTS")),
                  DataCell(Text("")),
                  DataCell(Container(
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.currency_rupee, color: Colors.red)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.green)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.blueAccent)),
                      ],
                    ),
                  )),
                ]),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
