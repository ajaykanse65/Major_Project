import 'package:bms/page/network.dart';
import 'package:flutter/material.dart';

class CardTypeDropDown extends StatefulWidget {
  const CardTypeDropDown({Key? key}) : super(key: key);

  @override
  State<CardTypeDropDown> createState() => _CardTypeDropDownState();
}

class _CardTypeDropDownState extends State<CardTypeDropDown> {
  String dropdownvalue = 'All';
  var items = ['Credit', 'Debit'];

  void test(){
    if (dropdownvalue == 'Credit'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Network()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 10,
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
              test();
            });
          },
        ),
      ),
    );
  }
}
