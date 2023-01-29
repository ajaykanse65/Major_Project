import 'package:bms/main.dart';
import 'package:bms/page/reminder.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final Action;
  const SearchBar({Key? key, this.Action}) : super(key: key);
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
      iconTheme: const IconThemeData(color: Colors.black),
      title: customSearchBar,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              if (customIcon.icon == Icons.search) {
                customIcon = const Icon(Icons.cancel);
                customSearchBar = const ListTile(
                  leading: Icon(
                    Icons.search,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search here...',
                    ),
                  ),
                );
              } else {
                customIcon = const Icon(Icons.search);
                customSearchBar = const Text("");
              }
            });
          },
          icon: customIcon,
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => reminder(),
              ),
            );
          },
          icon: Icon(Icons.notifications),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage2(),
              ),
            );
          },
          color: Colors.black,
          icon: Icon(Icons.logout),
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.deepOrangeAccent.shade200,
    );
  }
}
