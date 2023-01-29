import 'package:flutter/material.dart';
class AccountNameDropDown extends StatefulWidget {
  const AccountNameDropDown({Key? key}) : super(key: key);

  @override
  State<AccountNameDropDown> createState() => _AccountNameDropDownState();
}

class _AccountNameDropDownState extends State<AccountNameDropDown> {
  String dropdownvalue = 'abc';
  var items = ['abc', 'xyz', 'pqr', 'tts'];
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
            });
          },
        ),
      ),
    );
  }
}
