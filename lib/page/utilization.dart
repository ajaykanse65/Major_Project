import 'package:bms/page/home.dart';
import 'package:bms/page/reminder.dart';
import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../widget/custom_search_widget.dart';
import '../widget/navigation_drawer_widget.dart';
import '../widget/total_count_widget.dart';

void main() => runApp(uitilizationn());

class uitilizationn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(backgroundColor:Theme.of(context).primaryColor,onPressed: (){},label: Text("New Utilize",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),),elevation: 15,),

      appBar: SearchBar(titile: '',),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              HeadlineWidget(bal: '5000'),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: buildSearchField(),
              ),
              TotalCountWidget(
                count: '0',
                title: 'Total No. Of Assets',
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

  Widget buildSearchFeild() {
    return TextField();
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
                  "Product Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "Qnty",
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
                  "Description",
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
                  DataCell(Text("xyz")),
                  DataCell(Text("10")),
                  DataCell(Text("1500")),
                  DataCell(Text("Product Details")),
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
