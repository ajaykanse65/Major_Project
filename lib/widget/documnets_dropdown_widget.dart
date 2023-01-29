import 'package:flutter/material.dart';

class DocumnetDropDownWidget extends StatefulWidget {
  const DocumnetDropDownWidget({Key? key}) : super(key: key);

  @override
  State<DocumnetDropDownWidget> createState() => _DocumnetDropDownWidgetState();
}

class _DocumnetDropDownWidgetState extends State<DocumnetDropDownWidget> {
  String dropdownvalue = 'Aadhar card';
  var items = [
    'Customer App. Form',
    'Aadhar card',
    'PAN Card',
    'Driving License',
    'Passport',
    'Light Bill'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade400),
      child: Padding(
        padding: const EdgeInsets.only(left: 120),
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
            });
          },
        ),
      ),
    );
  }
}
