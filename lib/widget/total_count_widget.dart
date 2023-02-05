import 'package:flutter/material.dart';

class TotalCountWidget extends StatelessWidget {
  const TotalCountWidget({Key? key, required this.title, required this.count})
      : super(key: key);
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
          SizedBox(
            width: 8,
          ),
          Text(count,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
