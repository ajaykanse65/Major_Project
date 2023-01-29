// import 'package:flutter/material.dart';
//
// class CustomTableWidget extends StatelessWidget {
//   const CustomTableWidget({Key? key, required this.header1}) : super(key: key);
//   final String header1;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(16),
//       children: [
//         PaginatedDataTable(
//           columns: [
//             DataColumn(label: Text(header1)),
//           ],
//           source: _DataSource(context),
//         )
//       ],
//     );
//   }
// }
//
// class _Row {
//   _Row(
//     this.valueA,
//     this.valueB,
//     this.valueC,
//     this.valueD,
//   );
//   final String valueA;
//   final String valueB;
//   final String valueC;
//   final int valueD;
//
//   bool selected = false;
// }
//
// class _DataSource extends DataTableSource{
//   _DataSource(this.context){
//     _rows = <_Row>[
//       _Row('cell A1', 'Cell B1', 'Cell C1', 1)
//     ];
//   }
//
//   final BuildContext context;
//   List<_Row> -rows;
//
//   int _selectedCount = 0;
//   @override
//   DataRow getRow (int index){
//     assert(index >= 0);
//     if (index >= _rows.length) return null;
//   }
// }