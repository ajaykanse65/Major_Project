import 'package:bms/widget/custom_search_widget.dart';
import 'package:flutter/material.dart';

import '../widget/headline_widget.dart';
import '../widget/navigation_drawer_widget.dart';

class Network extends StatefulWidget {
  const Network({Key? key}) : super(key: key);

  @override
  State<Network> createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  final List<Map> _network = [
    {
      'networkname': 'Test Network Agent',
      'users': '3',
      'topup': '4,035',
      'dueamt': '10,300',
      'rperson': 'prasad',
      'contact': '9223351536',
      'address': '1548 bmc, 6, malad w',
      'PAN': 'test212234r',
      'gstn': '27test21234r',
    },
    {
      'networkname': 'Test Network Agent',
      'users': '3',
      'topup': '4,035',
      'dueamt': '10,300',
      'rperson': 'prasad',
      'contact': '9223351536',
      'address': '1548 bmc, 6, malad w',
      'PAN': 'test212234r',
      'gstn': '27test21234r',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const SearchBar(titile: '',),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const HeadlineWidget(bal: '5000'),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: networkTable(),
            )
          ],
        ),
      ),
    );
  }

  DataTable networkTable() {
    
    return DataTable(
      border: TableBorder.all(),
      columns: _networkColumn(),
      rows: _networkRow(),
      dividerThickness: 5,
      dataRowHeight: 80,
      showBottomBorder: true,
      headingTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      headingRowColor:
          MaterialStateProperty.resolveWith((states) => Colors.black),
    );
  }

  List<DataColumn> _networkColumn() {
    return [
      const DataColumn(
          label: Text(
        "Action",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Network Name",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Users",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Topup",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Due amt.",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Respnsible Person",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Contact",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "Address",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "PAN",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
      const DataColumn(
          label: Text(
        "GSTIN",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )),
    ];
  }

  List<DataRow> _networkRow() {
    return _network
        .map((network) => DataRow(cells: [
              DataCell(Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu, color: Colors.deepOrange)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.receipt_long,
                          color: Colors.blueAccent))
                ],
              )),
              DataCell(Text(network['networkname'])),
              DataCell(Text(network['users'])),
              DataCell(Text(network['topup'])),
              DataCell(Text(network['dueamt'])),
              DataCell(Text(network['rperson'])),
              DataCell(Text(network['contact'])),
              DataCell(Text(network['address'])),
              DataCell(Text(network['PAN'])),
              DataCell(Text(network['gstn'])),
            ]))
        .toList();
  }
}
