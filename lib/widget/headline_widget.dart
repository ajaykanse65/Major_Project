import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({Key? key, required this.bal}) : super(key: key);
  final String bal;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.deepOrangeAccent.shade200,
      ),
      width: MediaQuery.of(context).size.width,
      height: 40,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                DateFormat("dd-MM-yyyy").format(DateTime.now()),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                '|',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 3,
              ),
              Text("Current Balance :"),
              SizedBox(
                width: 1,
              ),
              Text(
                bal,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                '|',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 3,
              ),
              Text("Welcome"),
              SizedBox(
                width: 3,
              ),
              Text(
                "TestAgent",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
