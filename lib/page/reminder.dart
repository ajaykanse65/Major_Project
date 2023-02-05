import 'package:bms/widget/datepicker_widget.dart';
import 'package:bms/widget/dropdown_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class reminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.deepOrangeAccent.shade200,
          onPressed: () {},
          label: const Text(
            "New Reminder",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),),
          elevation: 15,
        ),
        appBar: AppBar(
          title: const Text('Reminder'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage2()));
              },
              icon: const Icon(Icons.logout),
              color: Colors.black,
            )
          ],
          backgroundColor: Colors.deepOrangeAccent.shade200,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                HeadlineWidget(bal: '5000'),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child:  Text(
                    'Status',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                FittedBox(
                  child: Row(
                    children: [
                      DropDownWidget(),
                      DatePickerWidget(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: buildSearchField(),
                ),
              ],
            ),
          ),
        ),
      );
}
