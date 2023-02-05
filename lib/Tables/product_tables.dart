import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductTable extends StatelessWidget {
   String productname, pname, gst, hsn, purchase, sale, opening;

  ProductTable(this.productname, this.pname, this.gst, this.hsn, this.purchase,
      this.sale, this.opening);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                        "Cr No.",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )),
                  DataColumn(
                      label: Text(
                        "Type",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )),
                  DataColumn(
                      label: Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )),
                  DataColumn(
                      label: Text(
                        "Stock",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )),
                  DataColumn(
                      label: Text(
                        "Pur. Rate",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )),
                  DataColumn(
                      label: Text(
                        "Sale Rate",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )),
                  DataColumn(
                      label: Text(
                        "GST Rate",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )),
                  DataColumn(
                      label: Text(
                        "HSN Code",
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
                    DataCell(Text("${productname}")),
                    DataCell(Text("${pname}")),
                    DataCell(Text("${opening}")),
                    DataCell(Text("${purchase}")),
                    DataCell(Text("${sale}")),
                    DataCell(Text("${gst}")),
                    DataCell(Text("${hsn}")),
                    DataCell(Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.print, color: Colors.black)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit, color: Colors.green)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete, color: Colors.red)),
                        ],
                      ),
                    )),
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
