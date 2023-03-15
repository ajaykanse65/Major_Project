import 'package:bms/page/home.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/datepicker_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/total_count_widget.dart';
import 'package:flutter/material.dart';
import '../widget/navigation_drawer_widget.dart';

void main() => runApp(quotation());

class quotation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){},label: Text("New Quatation",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),elevation: 15,),

      appBar: SearchBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              HeadlineWidget(bal: '5000'),
              SizedBox(
                height: 10.0,
              ),
             DatePickerWidget(),
              TotalCountWidget(title: 'Total No. Of Quatation', count: '5'),
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
                  "Quatation No",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "Customer Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "Mobile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(
                  "Quat Amt.",
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
                  DataCell(Text("15")),
                  DataCell(Text("Sanjay")),
                  DataCell(Text("9096257884")),
                  DataCell(Text("15000")),
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
