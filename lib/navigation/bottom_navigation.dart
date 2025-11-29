/*
This is bottom navigation in the app
*/

import 'package:deroli_mobile/screens/home/index.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // list of bottom screens
  static final List<Widget> _widgetOptions = <Widget>[
    const Activities(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    //
    final manager = Provider.of<ProjectsController>(context);

    return Scaffold(
      //
      body: Center(child: _widgetOptions[manager.selectedIndex]),

      // bottom navigation
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Colors.white,
        currentIndex: manager.selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          manager.setSelectedIndex(value);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,

        // styles
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFF838383),
        unselectedLabelStyle: Styles.normalText(context).copyWith(
          fontSize: Layout.getHeight(context, 11),
          fontWeight: FontWeight.w500,
        ),
        selectedLabelStyle: Styles.normalText(context).copyWith(
          fontSize: Layout.getHeight(context, 11),
          fontWeight: FontWeight.w600,
        ),

        // items
        // items
        items: [
          // home item
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/home.png",
              width: Layout.getHeight(context, 17),
              color: Styles.greyColor,
            ),
            label: "Home",
            activeIcon: Image.asset(
              "assets/icons/home.png",
              width: Layout.getHeight(context, 17),
              color: Colors.black,
            ),
          ),

          // transactions itwm
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/transactions.png",
              width: Layout.getHeight(context, 17),
              color: Styles.greyColor,
            ),
            label: "Transactions",
            activeIcon: Image.asset(
              "assets/icons/transactions.png",
              width: Layout.getHeight(context, 17),
              color: Colors.black,
            ),
          ),

          // report item
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/Person.png",
              width: Layout.getHeight(context, 19),
              color: Styles.greyColor,
            ),
            label: "Profile",
            activeIcon: Image.asset(
              "assets/icons/Person.png",
              width: Layout.getHeight(context, 19),
              color: Colors.black,
            ),
          ),

          //
        ],
      ),
    );
  }
}
