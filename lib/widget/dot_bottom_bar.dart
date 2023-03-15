import 'package:bms/page/home.dart';
import 'package:bms/page/new_user.dart';
import 'package:bms/page/task_manager.dart';
import 'package:bms/page/topup.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

class DotBotoomBar extends StatefulWidget {
  const DotBotoomBar({Key? key}) : super(key: key);

  @override
  State<DotBotoomBar> createState() => _DotBotoomBarState();
}

class _DotBotoomBarState extends State<DotBotoomBar> {
int _selectedIndex = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedIndex = i;
      if(i == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>home()));
      } if(i == 1){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> topup()));
      } if (i == 2){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskManager()));
      } if (i == 3){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> new_user()));
      } else {
        return null;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: DotNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.1),
        margin: EdgeInsets.only(left: 10, right: 10),
        currentIndex: _selectedIndex,
        dotIndicatorColor: Color(0xFF163252)
        ,
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xFF163252),
        onTap: _handleIndexChanged,
        items: [
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Color(0xFF163252),
            unselectedColor: Colors.black,
          ),

          DotNavigationBarItem(
            icon: Icon(Icons.currency_rupee),
            selectedColor: Color(0xFF163252),
            unselectedColor: Colors.black,
          ),

          DotNavigationBarItem(
            icon: Icon(Icons.task),
            selectedColor: Color(0xFF163252),
            unselectedColor: Colors.black,
          ),

          DotNavigationBarItem(
            icon: Icon(Icons.person),
            unselectedColor: Colors.black,
            selectedColor: Color(0xFF163252),
          ),
        ],
      ),
    );
  }
}


