import 'package:bms/page/reminder.dart';
import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/datepicker_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class gst_report extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: MultilevelDrawerWidget(),
    appBar: SearchBar(),
    body: Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          SizedBox(height: 10,),
          HeadlineWidget(bal: '5000'),
          SizedBox(height: 10,),
          DatePickerWidget(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonWidget(title: Text("Excel", style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),), onPressed: (){}, dimensionheight: 35, dimensionwidth: 110),
              CustomButtonWidget(title: Text("Search", style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),), onPressed: (){}, dimensionheight: 35, dimensionwidth: 110),

            ],
          )
        ],
      ),
    ),
  );
}