
import 'package:bms/Tables/product_tables.dart';
import 'package:flutter/material.dart';
import '../all_button_page/add_items.dart';
import '../widget/custom_search_widget.dart';
import '../widget/headline_widget.dart';
import '../widget/navigation_drawer_widget.dart';


class Product1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddItemsProduct()));
        },
        label: Text(
          "Add Item",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 17),
        ),
        elevation: 15,
      ),
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            HeadlineWidget(bal: '5000'),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: buildSearchField(),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}



