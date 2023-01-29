import 'package:flutter/material.dart';

class RenewalDropDownWidget extends StatefulWidget {
  const RenewalDropDownWidget({Key? key}) : super(key: key);

  @override
  State<RenewalDropDownWidget> createState() => _RenewalDropDownWidgetState();
}

class _RenewalDropDownWidgetState extends State<RenewalDropDownWidget> {
  String dropdownvalue = 'All';
  var items = ['All','Today Expiry','Yesterday Expired','Tomorrow Expired','Day After Tomorrow Expired','Today Renewed','All Expired','All Activated','All Disabled','Active but Offline','static IP List','Plan Wise User','Not Verified User'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade400),
      child:FittedBox(
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
