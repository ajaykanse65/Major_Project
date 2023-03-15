import 'package:bms/page/home.dart';
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

class new_sale extends StatefulWidget {
  @override
  State<new_sale> createState() => _new_saleState();
}

class _new_saleState extends State<new_sale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(backgroundColor:Theme.of(context).primaryColor,onPressed: (){},label: const Text("New Sales",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),),elevation: 15,),

      appBar: const SearchBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10,),
              const HeadlineWidget(bal: '5000',),
              const SizedBox(
                height: 10.0,
              ),
              const DatePickerWidget(),
              const TotalCountWidget(title: 'Total No. Of Invoice :', count: '5',),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: buildSearchField(),
              ),
               const TableWidgetPage(),
            ],
          ),
        ),
      ),
    );
  }
}
