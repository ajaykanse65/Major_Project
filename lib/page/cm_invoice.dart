import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/datepicker_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';



class cm_invoice extends StatelessWidget {
  const cm_invoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              HeadlineWidget(bal: '5000'),

              SizedBox(height: 10,),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DatePickerWidget(),
                    CustomButtonWidget(title: Text('Search',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),), onPressed: (){}, dimensionheight: 35, dimensionwidth: 110),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
