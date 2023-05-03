import 'package:bms/operator/operatorHome.dart';
import 'package:bms/operator/operatorNetwork.dart';
import 'package:bms/operator/operatorUser.dart';
import 'package:bms/operator/oprofile.dart';
import 'package:bms/operator/topup.dart';
import 'package:bms/page/home.dart';
import 'package:bms/page/new_user.dart';
import 'package:bms/page/task_manager.dart';
import 'package:bms/page/topup.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class BotoomBar extends StatefulWidget {
  final int selectedIndex;
  const BotoomBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<BotoomBar> createState() => _BotoomBarState();
}

class _BotoomBarState extends State<BotoomBar> {


  void _handleIndexChanged(int i) {
    setState(() {
      // widget.selectedIndex = i;
      if(i == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>OperatorHome()));
      } if(i == 1){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> OperatorUsers()));
      } if (i == 2){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> TopUP()));
      } if (i == 3){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> OperatorNetwork()));
      } if (i == 4){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> OpProfile()));
      }else {
        return null;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      DotNavigationBar(
       backgroundColor: Color(0xFF496585).withOpacity(0.9),
        margin: EdgeInsets.only(left: 10, right: 10),
        currentIndex: widget.selectedIndex,
        dotIndicatorColor: Colors.white,
        // curve: Curves.bounceIn,
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xFF163252),
        onTap: _handleIndexChanged,
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Colors.white,
            unselectedColor: Colors.black,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_outlined),
            selectedColor: Colors.white,
            unselectedColor: Colors.black,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.currency_rupee),
            selectedColor: Colors.white,
            unselectedColor: Colors.black,
          ),

          DotNavigationBarItem(
            icon: Icon(Icons.wifi),
            selectedColor: Colors.white,
            unselectedColor: Colors.black,
          ),

          DotNavigationBarItem(
            icon: Icon(Icons.person),
            unselectedColor: Colors.black,
            selectedColor: Colors.white,
          ),
        ],
      );

  }
}


