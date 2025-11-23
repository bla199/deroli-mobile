import 'dart:ui';

import 'package:deroli_mobile/components/general/border.dart';
import 'package:flutter/material.dart';

class ProjectSelection extends StatefulWidget {
  const ProjectSelection({super.key});

  @override
  State<ProjectSelection> createState() => _ProjectSelectionState();
}

class _ProjectSelectionState extends State<ProjectSelection> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                        // Backdrop that dismisses on tap
                        Positioned.fill(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                color: Colors.white.withOpacity(0.1),
                              ),
                            ),
                          ),
                        ),

                        // Dialog content
                        Transform.translate(
                          offset: Offset(0, 140),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Prevent dismissal when tapping on the dialog itself
                              },
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
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Select to explore',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
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
                                                MainAxisAlignment.spaceBetween,
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
                                                                'assets/icons/Activities.png',
                                                                width: 20,
                                                                height: 20,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text("All Projects"),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedValue = "option 1";
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
                                                                "option 1"
                                                            ? Color(0xFFE8E8E8)
                                                            : Color(0xFFE8E8E8),
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

                                          AppBorder(color: Color(0xFFEBEBEB)),
                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                selectedValue = "option 2";
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
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
                                                        ? Color(0xFFE8E8E8)
                                                        : Color(0xFFE8E8E8),
                                                    width: 3,
                                                  ),
                                                ),
                                                child:
                                                    selectedValue == "option 2"
                                                    ? Center(
                                                        child: Container(
                                                          width: 9,
                                                          height: 9,
                                                          decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
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
                                            MainAxisAlignment.spaceBetween,
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
                                                selectedValue = "option 3";
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
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
                                                        ? Color(0xFFE8E8E8)
                                                        : Color(0xFFE8E8E8),
                                                    width: 3,
                                                  ),
                                                ),
                                                child:
                                                    selectedValue == "option 3"
                                                    ? Center(
                                                        child: Container(
                                                          width: 9,
                                                          height: 9,
                                                          decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset('assets/icons/Activities.png', width: 15),
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
    );
  }
}
