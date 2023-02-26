import 'package:flutter/material.dart';

class TableWidgetPage extends StatefulWidget {
  const TableWidgetPage({Key? key}) : super(key: key);

  @override
  State<TableWidgetPage> createState() => _TableWidgetPageState();
}

class _TableWidgetPageState extends State<TableWidgetPage> {
  final List<Map> _sale = [
    {
      'id': '1',
      'Customer Name': 'pk_vsk',
      'Date': '04/06/2022',
      'GST Amt.': '0.00',
      'Invoice No': 'T2-22-23/7',
      'GSTN': '27AERP',
      'Mobile': '9167700165',
      'Bill amount': '0',
    },
    {
      'id': '2',
      'Customer Name': 'pk_vsk',
      'Date': '04 / 06 / 2022',
      'GST Amt.': '0.00',
      'Invoice No': 'T2-22-23/7',
      'GSTN': '27AERP',
      'Mobile': '9167700165',
      'Bill amount': '0',
    },
    {
      'id': '3',
      'Customer Name': 'pk_vsk',
      'Date': '04 / 06 / 2022',
      'GST Amt.': '0.00',
      'Invoice No': 'T2-22-23/7',
      'GSTN': '27AERP',
      'Mobile': '9167700165',
      'Bill amount': '0',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                headingTextStyle:
                const TextStyle(fontWeight: FontWeight.bold,),
                headingRowColor:
                MaterialStateProperty.resolveWith((states) => Colors.black),
                columnSpacing: 12,
                horizontalMargin: 12,
                columns: const [
                  DataColumn(
                      label: Text(
                    "Cr No.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    "Customer Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    "Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    "GST Amt.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    "Invoice No",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    "GSTN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    "Mobile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    "Bill amount",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    "Action",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )),
                ],
                rows: _salerow(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  List<DataRow> _salerow() {
    return _sale
        .map((sale) => DataRow(cells: <DataCell>[
              DataCell(Text(sale['id'])),
              DataCell(Text(sale['Customer Name'])),
              DataCell(Text(sale['Date'])),
              DataCell(Text(sale['GST Amt.'])),
              DataCell(Text(sale['Invoice No'])),
              DataCell(Text(sale['GSTN'])),
              DataCell(Text(sale['Mobile'])),
              DataCell(Text(sale['Bill amount'])),
              DataCell(
                ButtonBar(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.print, color: Colors.blue)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: Colors.green)),
                    IconButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> Loaction(),),);
                        },
                        icon:
                            const Icon(Icons.location_pin, color: Colors.blueAccent)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete, color: Colors.red))
                  ],
                ),
              ),
            ]))
        .toList();
  }
}
