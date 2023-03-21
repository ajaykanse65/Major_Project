import 'package:bms/login.dart';
import 'package:bms/main.dart';
import 'package:bms/page/reminder.dart';
import 'package:bms/service/usermanagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final Action;
  final String titile;
  const SearchBar({Key? key, this.Action,required this.titile}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('');

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text(widget.titile),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: <Widget>[
        // IconButton(
        //   onPressed: () {
        //     setState(() {
        //       if (customIcon.icon == Icons.search) {
        //         customIcon = const Icon(Icons.cancel);
        //         customSearchBar = const ListTile(
        //           leading: Icon(
        //             Icons.search,
        //           ),
        //           title: TextField(
        //             decoration: InputDecoration(
        //               hintText: 'Search here...',
        //             ),
        //           ),
        //         );
        //       } else {
        //         customIcon = const Icon(Icons.search);
        //         customSearchBar = const Text("");
        //       }
        //     });
        //   },
        //   icon: customIcon,
        // ),
        // IconButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => reminder(),
        //       ),
        //     );
        //   },
        //   icon: Icon(Icons.notifications),
        //
        // ),
        IconButton(
          onPressed: () {
            UserManagemnt().signOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage2(),
              ),
            );
          },
          icon: Icon(Icons.logout),
        ),
      ],
      centerTitle: true,
      backgroundColor: Color(0xFF778ba3),
    );
  }
}
