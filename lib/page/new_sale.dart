import 'package:bms/widget/circle_widget.dart';
import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/datepicker_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/table_widget.dart';
import '../widget/total_count_widget.dart';

void main() => runApp(new_sale());

class new_sale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(backgroundColor:Theme.of(context).primaryColor,onPressed: (){},label: Text("New Sales",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),),elevation: 15,),
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10,),
              HeadlineWidget(bal: '5000',),
              SizedBox(
                height: 10.0,
              ),
              DatePickerWidget(),
              TotalCountWidget(title: 'Total No. Of Invoice :', count: '5',),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: buildSearchField(),
              ),
              TableWidgetPage(),
            ],
          ),
        ),
      ),
    );
  }
}
