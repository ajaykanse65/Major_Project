import 'package:bms/page/home.dart';
import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/total_count_widget.dart';
import 'package:flutter/material.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:intl/intl.dart';

class on_users extends StatefulWidget {
  @override
  State<on_users> createState() => _on_usersState();
}

class _on_usersState extends State<on_users> {
  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  String tdata = DateFormat("HH:mm:ss a").format(DateTime.now());

  @override
  Widget build(BuildContext context) => Scaffold(

        appBar: SearchBar(),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                HeadlineWidget(bal: '5000'),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    TotalCountWidget(title: 'Online Users', count: '3'),
                    SizedBox(
                      width: 1,
                    ),
                    Icon(
                      Icons.refresh,
                      color: Colors.black,
                      size: 20,
                    ),
                  ],
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Online User list as on',
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        cdate,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        tdata,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: buildSearchField(),
                ),
                CustomButtonWidget(
                    title: Text(
                      'Disconnect',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    onPressed: () {},
                    dimensionheight: 35,
                    dimensionwidth: 110)
              ],
            ),
          ),
        ),
      );
}
