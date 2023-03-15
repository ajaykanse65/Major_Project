import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/datepicker_widget.dart';
import 'package:bms/widget/dropdown_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:flutter/material.dart';
import '../widget/navigation_drawer_widget.dart';
import 'home.dart';

class receipts extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SearchBar(),
    floatingActionButton: FloatingActionButton.extended(backgroundColor:Theme.of(context).primaryColor,onPressed: (){},label: Text("New Receipt",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),),elevation: 15,),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                HeadlineWidget(bal: '5000'),
                SizedBox(
                  height: 10,
                ),
                DatePickerWidget(),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: buildSearchField(),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropDownWidget(),
                      CustomButtonWidget(
                          title: Text(
                            'Cash Flow',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {},
                          dimensionheight: 35,
                          dimensionwidth: 110),
                      CustomButtonWidget(
                          title: Text(
                            'Search',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {},
                          dimensionheight: 35,
                          dimensionwidth: 110)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
