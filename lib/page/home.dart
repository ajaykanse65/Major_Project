import 'package:bms/pie_chart/categories_row.dart';
import 'package:bms/pie_chart/pie_chart_view.dart';
import 'package:bms/widget/dot_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/custom_flip_card.dart';
import '../widget/custom_search_widget.dart';
import '../widget/navigation_drawer_widget.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late SharedPreferences preferences;


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 223, 1),
      extendBody: true,
      drawer: MultilevelDrawerWidget(),
      bottomNavigationBar: DotBotoomBar(),
      appBar: SearchBar(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                          CategoriesRow(),
                          PieChartView(),
                        ],
                      ),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // body: Container(
      //   child: GridView(
      //     gridDelegate:
      //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //     children: <Widget>[
      //       CustomFilpcard(fronttext: 'Total\n Users:\n 5'),
      //       CustomFilpcard(fronttext: 'Active\n Users:\n 2'),
      //       CustomFilpcard(fronttext: 'Deactivated\n Users:\n 1'),
      //       CustomFilpcard(fronttext: 'Online\n Users:\n 2'),
      //       CustomFilpcard(fronttext: 'Yesterdays Exp.\n Users:\n 1'),
      //       CustomFilpcard(fronttext: 'Today Exp.\n Users:\n 0'),
      //       CustomFilpcard(fronttext: 'Todays\n Expenses:\n 4000'),
      //       CustomFilpcard(fronttext: 'Pending\n SMS:\n 7'),
      //
      //     ],
      //   ),
      // ),
    );
  }
}

Widget buildSearchField() {
  const color = Colors.black;

  return TextField(
    style: const TextStyle(color: color),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: 'Search',
      hintStyle: const TextStyle(color: color),
      prefixIcon: const Icon(Icons.search, color: color),
      filled: true,
      fillColor: Colors.white38,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color.withOpacity(0.7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: color.withOpacity(0.7)),
      ),
    ),
  );
}


