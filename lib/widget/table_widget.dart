import 'package:bms/widget/location.dart';
import 'package:flutter/material.dart';

class TableWidgetPage extends StatefulWidget {
  const TableWidgetPage({Key? key}) : super(key: key);

  @override
  State<TableWidgetPage> createState() => _TableWidgetPageState();
}

class _TableWidgetPageState extends State<TableWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: DataTable(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    columns: const[
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
                            "Customer Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )),
                      DataColumn(
                          label: Text(
                            "Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )),
                      DataColumn(
                          label: Text(
                            "GST Amt.",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )),
                      DataColumn(
                          label: Text(
                            "Invoice No",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )),
                      DataColumn(
                          label: Text(
                            "GSTN",
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
                            "Bill amount",
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
                    ],
                    rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Text("1")),
                        DataCell(Text("pk_vsk")),
                        DataCell(Text("04/06/2022")),
                        DataCell(Text("0.00")),
                        DataCell(Text("T2-22-23/7")),
                        DataCell(Text("27AERP")),
                        DataCell(Text("9167700165")),
                        DataCell(Text("0")),
                        DataCell( ButtonBar(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.print, color: Colors.blue)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.edit, color: Colors.green)),
                              IconButton(
                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> Loaction(),),);
                                  },
                                  icon: Icon(Icons.location_pin, color: Colors.blueAccent)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete, color: Colors.red))
                            ],
                          ),
                        ),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text("2")),
                        DataCell(Text("pk_snb")),
                        DataCell(Text("25/06/2022")),
                        DataCell(Text("0.00")),
                        DataCell(Text("T2-22-53/7")),
                        DataCell(Text("27AERPSPR")),
                        DataCell(Text('9096857884')),
                        DataCell(Text("0")),
                        DataCell(
                          ButtonBar(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.print, color: Colors.blue)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.edit, color: Colors.green)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.location_pin, color: Colors.blueAccent)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete, color: Colors.red))
                            ],
                          ),
                        )
                      ]),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
