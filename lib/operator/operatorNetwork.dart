import 'package:bms/admin/model/plandetails.dart';
import 'package:bms/customWidget/bottombar.dart';
import 'package:bms/operator/OperatorWidget/operatorDrawer.dart';
import 'package:bms/operator/operatorHome.dart';
import 'package:bms/operator/operatorUser.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

class OperatorNetwork extends StatefulWidget {
  const OperatorNetwork({Key? key}) : super(key: key);

  @override
  State<OperatorNetwork> createState() => _OperatorNetworkState();
}

class _OperatorNetworkState extends State<OperatorNetwork>with SingleTickerProviderStateMixin {
  List planList = [];
  Animation<double>? _animation;
  AnimationController? _animationController;
  @override
  void initState() {
    fetchPlanDetails();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }
  fetchPlanDetails() async {
    dynamic result = await PlanDetails().getPlanDetails();
    if (result == null) {
    } else {
      setState(() {
        planList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotoomBar(selectedIndex: 3,),
      backgroundColor: const Color.fromRGBO(193, 214, 223, 1),
      appBar: const SearchBar(titile: 'Plan Details'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: planList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(planList[index]['planName']),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget planListDetails() {
    return ListView.builder(
      itemCount: planList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(planList[index]['planName']),
          ),
        );
      },
    );
  }
}
