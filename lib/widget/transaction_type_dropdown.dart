import 'package:flutter/material.dart';

class TransactionDropDown extends StatefulWidget {
  const TransactionDropDown({Key? key}) : super(key: key);

  @override
  State<TransactionDropDown> createState() => _TransactionDropDownState();
}

class _TransactionDropDownState extends State<TransactionDropDown> {
  String dropdownvalue = 'All';
  var items = ['All','Cash', 'cheque', 'NEFT', 'PayTm'];

  // void test(){
  //   if (dropdownvalue == 'NEFT'){
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Network()));
  //   }else{}
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade400),
      child: Center(
        child: DropdownButton(
          value: dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
              // test();
            });
          },
        ),
      ),
    );
  }
}
