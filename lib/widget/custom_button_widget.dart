import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.dimensionheight,
    required this.dimensionwidth,
  }) : super(key: key);

  final Text title;
  final VoidCallback onPressed;
  final double dimensionheight;
  final double dimensionwidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: dimensionheight,
          width: dimensionwidth,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: title
          ),
        ),
      ),
    );
  }
}
