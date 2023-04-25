
import 'package:bms/admin/adminNetwrok.dart';
import 'package:bms/admin/adminOperator.dart';
import 'package:bms/admin/adminWidget/adminDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:bms/widget/dot_bottom_bar.dart';
import 'package:flutter/material.dart';



class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> with SingleTickerProviderStateMixin {
  bool isEmailVerified = false;
  Animation<double>? _animation;
  AnimationController? _animationController;
  @override
  void initState() {

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    getData();
    super.initState();
  }

  Future sendVerificationEmail() async{
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e){
      print(e.toString());
    }
  }
  String count ='';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
              icon: Icons.home,
              iconColor: Colors.black,
              title: 'DashBoard',
              titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor:   Color.fromRGBO(82, 98, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome()));
              }),
          Bubble(
              icon: Icons.person,
              iconColor: Colors.black,
              title: 'Operator',
              titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: Color.fromRGBO(255, 171, 67, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminOperator()));
              }),
          Bubble(
              icon: Icons.network_check,
              iconColor: Colors.black,
              title: 'Network',
              titleStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: Color.fromRGBO(46, 198, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminNetwork()));
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
      backgroundColor: Color.fromRGBO(193, 214, 223, 1),
      extendBody: true,
      // bottomNavigationBar: DotBotoomBar(),
      appBar: SearchBar(titile: 'Admin DashBoard',),
      body: SafeArea(
        child: Column(
            children: [
              SizedBox(
                height:  height * 0.43,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("User Details",style: GoogleFonts.rubik(fontWeight: FontWeight.w400,fontSize: 18),),
                      Expanded(child: Row(
                        children: [
                          // CategoriesRow(),
                          // PieChartView(count: count,),
                        ],
                      ),)
                    ],
                  ),
                ),
              ),
            ],
          ),

      ),
    );
  }
  getData() async{
    QuerySnapshot data = await FirebaseFirestore.instance.collection('collectionPath').get();
    var get = data.docs;
    var last = get.length.toString();
    setState(() {
      count = last;
    });
  }
}
