import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import '../widget/headline_widget.dart';
import '../widget/total_count_widget.dart';

void main() => runApp(vendor());

class vendor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(backgroundColor:Theme.of(context).primaryColor,onPressed: (){},label: Text("New vendor",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),),elevation: 15,),
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
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
            TotalCountWidget(title: 'Total Vendor :', count: '1'),
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
                    DataColumn(label: Text("Vendor Name", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),)),
                    DataColumn(label: Text("City", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),)),
                    DataColumn(label: Text("Phone", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),)),
                    DataColumn(label: Text("GSTN No", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),)),
                    DataColumn(label: Text("Payble", style: TextStyle(
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
                  DataCell(Text("Mumbai")),
                  DataCell(Text("9096257884")),
                  DataCell(Text("APOSE37RTS")),
                  DataCell(Text("yes")),
                  DataCell(Container(
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.print, color: Colors.black)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.green)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red)),
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
