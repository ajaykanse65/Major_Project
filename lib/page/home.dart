import 'package:bms/widget/dot_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../widget/custom_flip_card.dart';
import '../widget/custom_search_widget.dart';
import '../widget/navigation_drawer_widget.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: DotBotoomBar(),
      drawer: MultilevelDrawerWidget(),
      appBar: SearchBar(),
      body: Container(
        child: GridView(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            CustomFilpcard(fronttext: 'Total\n Users:\n 5'),
            CustomFilpcard(fronttext: 'Active\n Users:\n 2'),
            CustomFilpcard(fronttext: 'Deactivated\n Users:\n 1'),
            CustomFilpcard(fronttext: 'Online\n Users:\n 2'),
            CustomFilpcard(fronttext: 'Yesterdays Exp.\n Users:\n 1'),
            CustomFilpcard(fronttext: 'Today Exp.\n Users:\n 0'),
            CustomFilpcard(fronttext: 'Todays\n Expenses:\n 4000'),
            CustomFilpcard(fronttext: 'Pending\n SMS:\n 7'),

          ],
        ),
      ),
    );
  }
}
