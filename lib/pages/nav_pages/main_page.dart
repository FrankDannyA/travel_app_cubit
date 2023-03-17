import 'package:flutter/material.dart';
import 'package:travel_app_cubit/pages/nav_pages/bar_item_page.dart';
import 'package:travel_app_cubit/pages/nav_pages/home_page.dart';
import 'package:travel_app_cubit/pages/nav_pages/my_page.dart';
import 'package:travel_app_cubit/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          //home
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.apps),
          ),
          //bar
          BottomNavigationBarItem(
            label: "Bar",
            icon: Icon(Icons.bar_chart_sharp),
          ),
          //search
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          //My
          BottomNavigationBarItem(
            label: "My",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
