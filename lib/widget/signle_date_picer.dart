import 'package:flutter/material.dart';

class SingleDatePicker extends StatefulWidget {
  const SingleDatePicker({Key? key}) : super(key: key);

  @override
  State<SingleDatePicker> createState() => _SingleDatePickerState();
}

class _SingleDatePickerState extends State<SingleDatePicker> {
  String date= "";
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){_selectDate(context);},
      style: ElevatedButton.styleFrom(primary: Colors.grey),
      child: Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",style: TextStyle(fontSize: 17),),
    );
  }
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}
