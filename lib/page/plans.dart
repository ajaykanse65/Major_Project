import 'package:bms/page/home.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/headline_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:bms/widget/total_count_widget.dart';
import 'package:flutter/material.dart';


void main() => runApp(plans());

class plans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: SearchBar(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            HeadlineWidget(bal: '5000'),
            Row(
              children: [
                TotalCountWidget(title: "Total Plan", count: '5'),
                SizedBox(width: 1,),
                Icon(Icons.refresh,color: Colors.black,size: 20,)
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(9.0),
              child: buildSearchField(),
            ),
          ],
        ),
      ),
    );
  }


}
