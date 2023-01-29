import 'package:bms/Tables/product_tables.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import '../widget/cash_dropdown_widget.dart';
import '../widget/headline_widget.dart';

class AddItemsProduct extends StatefulWidget {
  const AddItemsProduct({Key? key}) : super(key: key);

  @override
  State<AddItemsProduct> createState() => _AddItemsProductState();
}

class _AddItemsProductState extends State<AddItemsProduct> {
  TextEditingController productcontroller = TextEditingController();
  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController productnamecontroller = TextEditingController();
  TextEditingController itemunitcontroller = TextEditingController();
  TextEditingController gstcontroller = TextEditingController();
  TextEditingController hsncontroller = TextEditingController();
  TextEditingController purchasecontroller = TextEditingController();
  TextEditingController salecontroller = TextEditingController();
  TextEditingController openingcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(height: 15,),
              Text(
                "Item Type",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CashDropDownWidget(),
              SizedBox(height: 10,),
              Text(
                'Product Type',
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
                  controller: productcontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter Product type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Company Name',
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
                  controller: companynamecontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter company name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Product Name',
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
                  controller: productnamecontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter product name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Item Unit',
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
                  controller: itemunitcontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter item unit',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'GST Rate',
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
                  controller: gstcontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter GST rate',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'HSN / SAC',
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
                  controller: hsncontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter HSC / SAC',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Purchase Rate',
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
                  controller: purchasecontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter Purchase rate',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Sale Rate',
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
                  controller: salecontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter sale rate',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              Text(
                'Opening Stock',
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
                  controller: openingcontroller,
                  decoration: InputDecoration(
                    hintText: 'enter opening stock',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductTable(productcontroller.text, productnamecontroller.text, gstcontroller.text, hsncontroller.text, purchasecontroller.text, salecontroller.text, openingcontroller.text)));

                  },child: Text("Add Item"),style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300),),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  },child: Text("Close"),style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade300),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
