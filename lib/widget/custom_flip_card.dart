import 'package:bms/Utils/colors.dart';
import 'package:bms/page/renewal.dart';
import 'package:flutter/material.dart';

class CustomFilpcard extends StatelessWidget {
  const CustomFilpcard({
    Key? key,
    required this.fronttext,
  }) : super(key: key);
  final String fronttext;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 40,
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/person.png"),
              opacity: 1000.0,
              fit: BoxFit.fill),
          gradient: LinearGradient(
            colors: cardcolor,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text(
                  fronttext,
                  maxLines: 3,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => renewal()));
                },
              )
            ]),
      ),
    );
  }
}
