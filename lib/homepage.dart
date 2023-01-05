import 'package:alankara/homePageItems/entryDetails.dart';
import 'package:alankara/homePageItems/registerBook.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  final pages = [RegisterBook(), EntryDetails() ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });

          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(
                FontAwesomeIcons.book,
                color: Colors.blue,
              ),
              title: Text(
                "Register",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              selectedColor: Colors.black38,
              unselectedColor: Colors.grey,
            ),

            SalomonBottomBarItem(
              icon: Icon(
                FontAwesomeIcons.bookOpen,
                color: Colors.pinkAccent,
              ),
              title: Text(
                "Details",
                style: TextStyle(
                  fontSize: 15,
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
