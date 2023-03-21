import 'package:bms/page/home.dart';
import 'package:bms/page/reminder.dart';
import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:bms/widget/report_drop_down_widget.dart';
import 'package:bms/widget/signle_date_picer.dart';
import 'package:bms/widget/total_count_widget.dart';
import 'package:flutter/material.dart';

import '../main.dart';

void main() => runApp(report());

class report extends StatefulWidget {
  const report({Key? key}) : super(key: key);

  @override
  State<report> createState() => _reportState();
}

class _reportState extends State<report> {
  List<String> items = [
    "Active User",
    "Expire User",
    "Renewed User",
    "verified User",
    "Free Invoice",
    "Operator Topup",
    "Operator Receipt",
    "Due Report"
  ];
  DateTime date = DateTime(2022, 06, 10);
  String? selectedItem = "Active User";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: SearchBar(titile: '',),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            HeadlineWidget(bal: '5000'),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TotalCountWidget(title: "Total Record:", count: "0"),
                ReportDropDownWidget()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SingleDatePicker(),
                CustomButtonWidget(
                    title: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {},
                    dimensionheight: 35,
                    dimensionwidth: 110)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: buildSearchField(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(
                    title: Text(
                      'Excel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {},
                    dimensionheight: 35,
                    dimensionwidth: 110),
                CustomButtonWidget(
                    title: Text(
                      'Monthly Excel',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {},
                    dimensionheight: 35,
                    dimensionwidth: 110),
              ],
            )
          ],
        ),
      ),
    );
  }
}
