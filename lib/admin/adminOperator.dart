import 'package:bms/admin/addOperator.dart';
import 'package:bms/admin/adminHome.dart';
import 'package:bms/admin/adminNetwrok.dart';
import 'package:bms/admin/adminWidget/adminDrawer.dart';
import 'package:bms/admin/model/plandetails.dart';
import 'package:bms/widget/custom_search_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

class AdminOperator extends StatefulWidget {
  const AdminOperator({Key? key}) : super(key: key);

  @override
  State<AdminOperator> createState() => _AdminOperatorState();
}

class _AdminOperatorState extends State<AdminOperator> with SingleTickerProviderStateMixin {

  final Stream<QuerySnapshot> userStream = FirebaseFirestore.instance.collection('operator').snapshots();
  Animation<double>? _animation;
  AnimationController? _animationController;
  String name= '';


  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged(){
    print(_searchController.toString());
  }

  @override
  void dispose(){
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  String dropdownvalue = 'Admin';
  var items = ['Admin', 'Operator'];

  List operator = [];
  final TextEditingController _searchController = TextEditingController();

  Future<void> operatorList() async{

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHome()));
              }),
          Bubble(
              icon: Icons.network_check,
              iconColor: Colors.black,
              title: 'Network',
              titleStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: const Color.fromRGBO(46, 198, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminNetwork()));
              }),
          Bubble(
              icon: Icons.add_circle_outlined,
              iconColor: Colors.black,
              title: 'New Operator',
              titleStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17),
              bubbleColor: const Color.fromRGBO(46, 198, 255, 1),
              onPress: () {
                _animationController!.reverse();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  AddOperator()));
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
      drawer: const AdminDrawer(),
     appBar: const SearchBar(titile: 'Operator'),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(10),
         child: Column(
               children: [
                 TextField(
                   controller: _searchController,
                   decoration: const InputDecoration(
                   prefixIcon: Icon(Icons.search),
                   hintText: 'Search...'
                   ),
                   onChanged: (val){
                     setState(() {
                       name= val;
                     });
                   },
                 ),
                 table(context),
               ],
             ),
       ),
     ),
    );
  }

  Widget test(BuildContext context){
    return AlertDialog(
      content: ClipRRect(
        child: Image.network("https://firebasestorage.googleapis.com/v0/b/majorproject-3dbfa.appspot.com/o/files%2FIMG_20230415_125124.jpg?alt=media&token=0df2fab2-d59f-4fd2-85ca-de4318617efa",fit: BoxFit.fill,),
      ),
    );
  }


  Widget table(BuildContext context){
    return StreamBuilder<QuerySnapshot>(stream: userStream,
        builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            print('object');
          }if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          final List storedoc= [];

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data()as Map<String, dynamic>;
            storedoc.add(a);
          }).toList();
          return
            Column(
              children: [
                for (var i = 0; i < storedoc.length; i++)...[
                  SizedBox(
                    child: Card(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child:ListTile(title: Text("${storedoc[i]['fname']} ${storedoc[i]['lname']}")),

                    ),
                  ),
                ],

              ],
            );
        });
  }

  Widget dropdown(){
    return DropdownButton(
      value: dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(items),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}
