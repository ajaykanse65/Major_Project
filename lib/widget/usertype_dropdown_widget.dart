import 'package:flutter/material.dart';

class UserTypeDropDownWidget extends StatefulWidget {
  const UserTypeDropDownWidget({Key? key}) : super(key: key);

  @override
  State<UserTypeDropDownWidget> createState() => _UserTypeDropDownWidgetState();
}

class _UserTypeDropDownWidgetState extends State<UserTypeDropDownWidget> {
  String dropdownvalue = 'Individual';
  var items = ['Individual', 'Corporate'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
      ),
      child: DropdownButton(
        value: dropdownvalue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(items),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
      ),
    );
  }
}
