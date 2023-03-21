

import 'package:bms/operator/OperatorWidget/operatorDrawer.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:flutter/material.dart';

class OperatorUsers extends StatefulWidget {
  const OperatorUsers({Key? key}) : super(key: key);

  @override
  State<OperatorUsers> createState() => _OperatorUsersState();
}

class _OperatorUsersState extends State<OperatorUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OperatorDrawer(),
      appBar: SearchBar(titile: 'titile'),
      body: Text(""),
    );
  }
}
