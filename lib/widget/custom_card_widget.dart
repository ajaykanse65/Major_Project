import 'package:flutter/material.dart';

import '../Utils/colors.dart';

class CustomCardWidget extends StatefulWidget {
  const CustomCardWidget({Key? key}) : super(key: key);

  @override
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 25,
      decoration: BoxDecoration(gradient: LinearGradient(colors: cardcolor)),
      child: Card(),
    );
  }
}
