import 'package:flutter/material.dart';

class CashDropDownWidget extends StatefulWidget {
  const CashDropDownWidget({Key? key}) : super(key: key);

  @override
  State<CashDropDownWidget> createState() => _CashDropDownWidgetState();
}

class _CashDropDownWidgetState extends State<CashDropDownWidget> {
  String dropdownvalue = 'Cash';
  var items = ['Cash', 'cheque', 'NEFT', 'PayTm'];
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
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ),
      );
  }
}
