import 'package:bms/page/home.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/datepicker_widget.dart';
import 'package:bms/widget/dropdown_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
class TaskManager extends StatelessWidget {
  const TaskManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBody: true,
      floatingActionButton: FloatingActionButton.extended(backgroundColor: Colors.deepOrangeAccent.shade200,onPressed: (){},label: Text("Add New Task",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 17),),elevation: 15,),
      appBar: SearchBar(),

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              HeadlineWidget(bal: '5000'),
              const SizedBox(height: 10,),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("Total Task: ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                    ),
                    SizedBox(width: 2,),
                    Text('1',style:TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                    SizedBox(width: 1,),
                    Icon(Icons.refresh,size: 17),
                    SizedBox(width: 20,),
                    DatePickerWidget()
                  ],
                ),
              ),
              SizedBox(height: 10,),
              DropDownWidget(),
              SizedBox(height: 10,),
              buildSearchField()
            ],
          ),
        )
      ),
    );
  }
}
