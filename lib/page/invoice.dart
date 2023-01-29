import 'package:bms/widget/custom_button_widget.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/datepicker_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/total_count_widget.dart';
import 'package:flutter/material.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';

class invoice extends StatelessWidget {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController invoicecontroller = TextEditingController();
  @override
  void dispose(){
    usernamecontroller.dispose();
    invoicecontroller.dispose();
  }

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
              
              SizedBox(height: 15,),
              Text(
                'By User Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 40,
                child: TextFormField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter User ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Invoice No',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 40,
                child: TextFormField(
                  controller: invoicecontroller,
                  decoration: InputDecoration(
                    hintText: 'Invoice Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              TotalCountWidget(title: 'Total Invoices', count: '0'),
              DatePickerWidget(),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButtonWidget(title: Text("Search",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500,),), onPressed: (){}, dimensionheight: 35, dimensionwidth: 110),
                  CustomButtonWidget(title: Text("Excel",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500,),), onPressed: (){}, dimensionheight: 35, dimensionwidth: 110),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

