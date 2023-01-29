import 'package:flutter/material.dart';

class ReportDropDownWidget extends StatefulWidget {
  const ReportDropDownWidget({Key? key}) : super(key: key);

  @override
  State<ReportDropDownWidget> createState() => _ReportDropDownWidgetState();
}

class _ReportDropDownWidgetState extends State<ReportDropDownWidget> {
  String dropdownvalue = 'Active User';
  var items = ['Active User','Expired User','Renewed User','Verified User','Free Invoice','Operator Topup','Operator Receipt','Due Report'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade400),
      child:Padding(
        padding: const EdgeInsets.only(left: 9.0),
        child:  DropdownButton(
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
              });
            },
          ),

      ),
    );
  }
}
