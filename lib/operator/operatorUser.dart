

import 'package:bms/operator/OperatorWidget/operatorDrawer.dart';
import 'package:bms/operator/adduser.dart';
import 'package:bms/operator/operatorHome.dart';
import 'package:bms/operator/operatorNetwork.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

class OperatorUsers extends StatefulWidget {
  const OperatorUsers({Key? key}) : super(key: key);

  @override
  State<OperatorUsers> createState() => _OperatorUsersState();
}

class _OperatorUsersState extends State<OperatorUsers> with SingleTickerProviderStateMixin{
  Animation<double>? _animation;
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
              icon: Icons.home,
              iconColor: Colors.black,
              title: 'DashBoard',
              titleStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor:   const Color.fromRGBO(82, 98, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OperatorHome()));
              }),
          Bubble(
              icon: Icons.network_check,
              iconColor: Colors.black,
              title: 'Network',
              titleStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: const Color.fromRGBO(46, 198, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OperatorNetwork()));
              }),
          Bubble(
              icon: Icons.add_circle_outlined,
              iconColor: Colors.black,
              title: 'New Operator',
              titleStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: const Color.fromRGBO(46, 198, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  const AddUser()));
              }),
        ],

        animation: _animation!,
        onPress: () => _animationController!.isCompleted
            ? _animationController!.reverse()
            : _animationController!.forward(),
        backGroundColor: Theme.of(context).primaryColor,
        iconColor: Colors.white,
        iconData: Icons.menu,
      ),
      backgroundColor: const Color.fromRGBO(193, 214, 223, 1),
      appBar: SearchBar(titile: 'User'),
      body: Text(""),
    );
  }
}
