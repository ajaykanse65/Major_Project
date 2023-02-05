import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/renewl_dropdown_widget.dart';
import 'package:flutter/material.dart';
import '../widget/custom_button_widget.dart';
import '../widget/custom_search_widget.dart';
import '../widget/navigation_drawer_widget.dart';
import '../widget/table_widget.dart';
import '../widget/total_count_widget.dart';

class renewal extends StatefulWidget {
  const renewal({Key? key}) : super(key: key);

  @override
  State<renewal> createState() => _renewalState();
}

class _renewalState extends State<renewal> {
 bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              SizedBox(
                height: 10,
              ),
              HeadlineWidget(bal: '5000'),
              SizedBox(
                height: 10,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RenewalDropDownWidget(),
                    TotalCountWidget(title: 'Total Count', count: '0/0')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: buildSearchField(),
              ),
              CustomButtonWidget(
                title: Text(
                  'Search',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                dimensionheight: 35,
                dimensionwidth: 110,
              ),
              Visibility(
                visible: isVisible,
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                child: TableWidgetPage(),),
            ],
          ),
        ),
      ),
    );
  }
}
