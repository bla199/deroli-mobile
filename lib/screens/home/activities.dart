import 'package:deroli_mobile/components/main.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../components/general/activities/activity_notification.dart';
import 'dart:ui';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        // actionsPadding: EdgeInsets.only(right: 20),
        backgroundColor: Color(0xFFF9F9F9),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFFFFFF)),
                ),
                onPressed: null,
                icon: Image.asset(
                  'assets/icons/Person.png',
                  width: 25,
                  height: 25,
                ),
              ),

              IconButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFFFFFF)),
                ),
                onPressed: null,
                icon: (Image.asset(
                  'assets/icons/Notification.png',
                  width: 25,
                  height: 25,
                )),
              ),
            ],
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Centered filled button
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: FilledButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        String selectedValue = "option 1";
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Stack(
                              children: [
                                BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 5,
                                    sigmaY: 5,
                                  ),
                                  child: Container(
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                ),

                                Transform.translate(
                                  offset: Offset(0, 140),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ),
                                    child: Dialog(
                                      backgroundColor: Color(0XFFFFFFFF),
                                      insetPadding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadiusGeometry.all(
                                          Radius.circular(40),
                                        ),
                                      ),
                                      child: Container(
                                        height: 350,
                                        width: MediaQuery.of(
                                          context,
                                        ).size.width,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                25.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Select to explore',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          // color: Color(0XFF000000),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                            AppBorder(color: Color(0xFFEBEBEB)),

                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal:
                                                                    20.0,
                                                                vertical: 25,
                                                              ),
                                                          child: Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.only(
                                                                      right:
                                                                          30.0,
                                                                    ),
                                                                child: Container(
                                                                  width: 35,
                                                                  height: 35,
                                                                  decoration: BoxDecoration(
                                                                    color: Color(
                                                                      0xFFF3F3F3,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                          Radius.circular(
                                                                            20,
                                                                          ),
                                                                        ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                          8.0,
                                                                        ),
                                                                    child: Image.asset(
                                                                      'assets/icons/Activities.png',
                                                                      width: 20,
                                                                      height:
                                                                          20,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                "All Projects",
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedValue =
                                                              "option 1";
                                                        });
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              right: 20.0,
                                                            ),
                                                        child: Container(
                                                          width: 22,
                                                          height: 22,
                                                          decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color:
                                                                  selectedValue ==
                                                                      "option 1"
                                                                  ? Color(
                                                                      0xFFE8E8E8,
                                                                    )
                                                                  : Color(
                                                                      0xFFE8E8E8,
                                                                    ),
                                                              width: 3,
                                                            ),
                                                          ),
                                                          child:
                                                              selectedValue ==
                                                                  "option 1"
                                                              ? Center(
                                                                  child: Container(
                                                                    width: 9,
                                                                    height: 9,
                                                                    decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: Color(
                                                                        0xFF3F2FBB, // inner dot
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                AppBorder(
                                                  color: Color(0xFFEBEBEB),
                                                ),
                                              ],
                                            ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 20.0,
                                                            vertical: 25,
                                                          ),
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                  right: 30.0,
                                                                ),
                                                            child: Container(
                                                              width: 35,
                                                              height: 35,
                                                              decoration: BoxDecoration(
                                                                color: Color(
                                                                  0xFFF3F3F3,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.all(
                                                                      Radius.circular(
                                                                        20,
                                                                      ),
                                                                    ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets.all(
                                                                      8.0,
                                                                    ),
                                                                child: Image.asset(
                                                                  'assets/icons/Fire@3x.png',
                                                                  width: 20,
                                                                  height: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Ndondo Cup Project 2025",
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedValue =
                                                          "option 2";
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          right: 20.0,
                                                        ),
                                                    child: Container(
                                                      width: 22,
                                                      height: 22,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color:
                                                              selectedValue ==
                                                                  "option 2"
                                                              ? Color(
                                                                  0xFFE8E8E8,
                                                                )
                                                              : Color(
                                                                  0xFFE8E8E8,
                                                                ),
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child:
                                                          selectedValue ==
                                                              "option 2"
                                                          ? Center(
                                                              child: Container(
                                                                width: 9,
                                                                height: 9,
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Color(
                                                                    0xFF3F2FBB, // inner dot
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                            AppBorder(color: Color(0xFFEBEBEB)),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 20.0,
                                                            vertical: 25,
                                                          ),
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                  right: 30.0,
                                                                ),
                                                            child: Container(
                                                              width: 35,
                                                              height: 35,
                                                              decoration: BoxDecoration(
                                                                color: Color(
                                                                  0xFFF3F3F3,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius.all(
                                                                      Radius.circular(
                                                                        20,
                                                                      ),
                                                                    ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets.all(
                                                                      8.0,
                                                                    ),
                                                                child: Image.asset(
                                                                  'assets/icons/Compass_fill@3x.png',
                                                                  width: 20,
                                                                  height: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Mix By Yas re-branding",
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedValue =
                                                          "option 3";
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          right: 20.0,
                                                        ),
                                                    child: Container(
                                                      width: 22,
                                                      height: 22,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color:
                                                              selectedValue ==
                                                                  "option 3"
                                                              ? Color(
                                                                  0xFFE8E8E8,
                                                                )
                                                              : Color(
                                                                  0xFFE8E8E8,
                                                                ),
                                                          width: 3,
                                                        ),
                                                      ),
                                                      child:
                                                          selectedValue ==
                                                              "option 3"
                                                          ? Center(
                                                              child: Container(
                                                                width: 9,
                                                                height: 9,
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Color(
                                                                    0xFF3F2FBB, // inner dot
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(
                          'assets/icons/Activities.png',
                          width: 15,
                        ),
                      ),

                      const SizedBox(width: 10),
                      const Text(
                        "All Projects",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      const SizedBox(width: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(
                          'assets/icons/Arrow_Down.png',
                          width: 14,
                          height: 14,
                        ),
                      ), // plain Icon -> no extra padding
                    ],
                  ),
                ),
              ),
            ),

            // Pending request block
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          children: [
                            const Text("Pending request"),
                            const SizedBox(height: 8),
                            // Align "TZS" above the baseline of the amount
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Text(
                                      "TZS",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    alignment:
                                        PlaceholderAlignment.aboveBaseline,
                                    baseline: TextBaseline.alphabetic,
                                  ),
                                  WidgetSpan(child: SizedBox(width: 8)),
                                  TextSpan(
                                    text: "200,000",
                                    style: TextStyle(
                                      fontFamily: 'Fredoka',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: FilledButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color(0xFF312684),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  spacing: 10,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/icons/Send_2.png',
                                      width: 18,
                                    ),
                                    Text(
                                      "Request Money",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFD8D6FF),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quick Actions", style: TextStyle(fontSize: 14)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(45),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      IconButton(
                                        color: Color(0xFFEAE7FF),
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/icons/Upload.png',
                                          width: 40,
                                        ),
                                        iconSize: 10,
                                        style: IconButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Retire",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),

                                  Column(
                                    children: [
                                      IconButton(
                                        color: Color(0xFFEAE7FF),
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/icons/Paper.png',
                                          width: 40,
                                        ),
                                        iconSize: 10,
                                        style: IconButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Invoice",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/icons/Send_1.png',
                                          width: 40,
                                        ),
                                        style: IconButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Requested",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recent Activities"),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/circle_duotone.png',
                            width: 35,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),

                      child: Column(
                        children: [
                          ActivityNotification(),
                          DashedBorder(color: Color(0xFFDEDEDE)),
                          ActivityNotification(),
                          DashedBorder(color: Color(0xFFDEDEDE)),
                          ActivityNotification(),
                          DashedBorder(color: Color(0xFFDEDEDE)),
                          ActivityNotification(),
                          DashedBorder(color: Color(0xFFDEDEDE)),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("View all activities"),
                                  SizedBox(width: 5),
                                  Image.asset(
                                    'assets/icons/Arrow_Right.png',
                                    width: 13,
                                    height: 13,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(children: [Container(height: 60)]),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),

        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          backgroundColor: Colors.white.withOpacity(0.65),
          selectedItemColor: const Color(0xFF312684),

          unselectedItemColor: Colors.black38,
          iconSize: 28,
          elevation: 2,

          currentIndex: _selectedIndex,
          onTap: (value) {
            _onItemTapped(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
