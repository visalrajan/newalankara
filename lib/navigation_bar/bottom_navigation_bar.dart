import 'package:alankara/homepage.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatefulWidget {

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int currentIndex = 0;
  final pages = [HomePage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentIndex,
          onTap: (index) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              selectedColor: Colors.black38,
              unselectedColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
