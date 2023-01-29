import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';


void main() => runApp(emp());

class emp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            HeadlineWidget(bal: '5000'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtonWidget(
                    title: Text(
                      'New Employee',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {},
                    dimensionheight: 35,
                    dimensionwidth: 140,),
                CustomButtonWidget(
                  title: Text(
                    'Attendance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {},
                  dimensionheight: 35,
                  dimensionwidth: 110,),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(9.0),
              child: buildSearchField(),
            ),
            SizedBox(
              height: 10.0,
            ),
            buildDataFeild(),
          ],
        ),
      ),
    );
  }

  Widget buildDataFeild() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child:
                  DataTable(columnSpacing: 10, horizontalMargin: 10, columns: [
                DataColumn(
                    label: Text(
                  "Cr No.",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )),
                DataColumn(
                    label: Text(
                  "Employee Name",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )),
                DataColumn(
                    label: Text(
                  "Address",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )),
                DataColumn(
                    label: Text(
                  "Mobile",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )),
                DataColumn(
                    label: Text(
                  "Gender",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )),
                DataColumn(
                    label: Text(
                  "Balance",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )),
                DataColumn(
                    label: Text(
                  "Action",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )),
              ], rows: <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(Text("1")),
                  DataCell(Text("Vijay")),
                  DataCell(Text("09, Nalasopara E")),
                  DataCell(Text("9096257884")),
                  DataCell(Text("Male")),
                  DataCell(Text("1500")),
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
            )
          ],
        ),
      ),
    );
  }
}
