import 'package:flutter/material.dart';

class SocialDropDownWidget extends StatefulWidget {
  const SocialDropDownWidget({Key? key}) : super(key: key);

  @override
  State<SocialDropDownWidget> createState() => _SocialDropDownWidgetState();
}

class _SocialDropDownWidgetState extends State<SocialDropDownWidget> {
  String dropdownvalue = 'Facebook';
  var items = ['Facebook', 'Twitter', 'Instagram', 'Google', 'LinkedIN'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade400),
      child: Padding(
        padding: const EdgeInsets.only(left: 180),
        child: DropdownButton(
          value: dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items,textAlign: TextAlign.center,),
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
