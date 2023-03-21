
import 'package:bms/operator/OperatorWidget/operatorDrawer.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:flutter/material.dart';

class OperatorNetwork extends StatefulWidget {
  const OperatorNetwork({Key? key}) : super(key: key);

  @override
  State<OperatorNetwork> createState() => _OperatorNetworkState();
}

class _OperatorNetworkState extends State<OperatorNetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OperatorDrawer(),
      appBar: SearchBar(titile: 'titile'),
      body: Text(""),
    );
  }
}
