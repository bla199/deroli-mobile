/*
This is bottom navigation in the app
*/

import 'package:deroli_mobile/navigation/liquid_bar.dart';
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
      body: Stack(
        children: [
          Positioned.fill(child: _widgetOptions[manager.selectedIndex]),

          //
          SafeArea(
            bottom: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: LiquidGlassBottomBar(
                fake: false,
                tabs: [
                  LiquidGlassBottomBarTab(
                    icon: Image.asset(
                      "assets/icons/home.png",
                      width: Layout.getHeight(context, 24),
                      color: Styles.greyColor,
                    ),
                    label: "Home",
                    selectedIcon: Image.asset(
                      "assets/icons/home.png",
                      width: Layout.getHeight(context, 24),
                      color: Color(0xFF312684),
                    ),
                    textColor: Styles.greyColor,
                    selectedTextColor: Color(0xFF312684),
                  ),
                  LiquidGlassBottomBarTab(
                    icon: Image.asset(
                      "assets/icons/transactions.png",
                      width: Layout.getHeight(context, 24),
                      color: Styles.greyColor,
                    ),
                    label: "Transactions",
                    selectedIcon: Image.asset(
                      "assets/icons/transactions.png",
                      width: Layout.getHeight(context, 24),
                      color: Color(0xFF312684),
                    ),
                    textColor: Styles.greyColor,
                    selectedTextColor: Color(0xFF312684),
                  ),
                  LiquidGlassBottomBarTab(
                    icon: Image.asset(
                      "assets/icons/Person.png",
                      width: Layout.getHeight(context, 24),
                      color: Styles.greyColor,
                    ),
                    label: "Profile",
                    selectedIcon: Image.asset(
                      "assets/icons/Person.png",
                      width: Layout.getHeight(context, 24),
                      color: Color(0xFF312684),
                    ),
                    textColor: Styles.greyColor,
                    selectedTextColor: Color(0xFF312684),
                  ),
                ],
                selectedIndex: manager.selectedIndex,
                onTabSelected: (index) {
                  manager.setSelectedIndex(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
