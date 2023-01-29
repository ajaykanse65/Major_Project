import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
String date= "";
DateTime selectedDate = DateTime.now();
DateTime selectedendDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Row(
        children: [
         ElevatedButton(onPressed: (){_selectDate(context);},
           style: ElevatedButton.styleFrom(primary: Colors.grey),
           child: Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",style: TextStyle(fontSize: 17),),
         ),
          SizedBox(width: 4,),
          ElevatedButton(onPressed: (){_selectendDate(context);},
            style: ElevatedButton.styleFrom(primary: Colors.grey),
            child: Text("${selectedendDate.day}/${selectedendDate.month}/${selectedendDate.year}",style: TextStyle(fontSize: 17),),
          ),
        ],
      ),
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

_selectendDate(BuildContext context) async {
  final DateTime? selected = await showDatePicker(
    context: context,
    initialDate: selectedendDate,
    firstDate: DateTime(2010),
    lastDate: DateTime(2025),
  );
  if (selected != null && selected != selectedendDate)
    setState(() {
      selectedendDate = selected;
    });
}
}
