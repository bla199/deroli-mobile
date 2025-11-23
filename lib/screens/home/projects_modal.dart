/*
This modal is used for display filters
*/

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:deroli_mobile/utils/index.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({super.key});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  // get screen size
  late Size screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = Layout.getSize(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width * 0.87,
      margin: EdgeInsets.only(bottom: Layout.getWidth(context, 80)),
      //

      //
      child: Padding(
        //
        padding: EdgeInsets.symmetric(vertical: Layout.getHeight(context, 15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            // list of filters for transactions
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Layout.getHeight(context, 40),
                ),
              ),

              // list of filters
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(Layout.getHeight(context, 25)),
                  // into
                  Padding(
                    padding: EdgeInsets.only(
                      left: Layout.getWidth(context, 25),
                    ),
                    child: Text(
                      "Select to explore",
                      style: Styles.normalText(context).copyWith(
                        color: Colors.black,
                        fontSize: Layout.getHeight(context, 14),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Gap(Layout.getHeight(context, 25)),
                  Divider(
                    height: Layout.getHeight(context, 0.5),
                    color: const Color(0xFFEBEBEB),
                  ),

                  //
                  InkWell(
                    // call function to filter today
                    onTap: () {},
                    child: transactionFilter(
                      context: context,
                      // today transactions
                      hasDivider: true,
                      title: "All Projects",
                      textColor: Colors.black,
                      imagePath: 'assets/icons/Activities.png',
                      isSelected: true,
                    ),
                  ),

                  //
                  InkWell(
                    // call function to filter week
                    onTap: () {},
                    child: transactionFilter(
                      context: context,
                      // week transactions
                      hasDivider: true,
                      title: "Ndodo Cup Project 2025",
                      textColor: Colors.black,
                      imagePath: 'assets/icons/Fire@3x.png',
                      isSelected: false,
                    ),
                  ),

                  //
                  InkWell(
                    // call function to filter month
                    onTap: () {},
                    child: transactionFilter(
                      context: context,
                      // month transactions
                      hasDivider: false,
                      title: "Mix By Yas re-branding",
                      textColor: Colors.black,
                      imagePath: 'assets/icons/Compass_fill@3x.png',
                      isSelected: false,
                    ),
                  ),

                  //
                  Gap(Layout.getHeight(context, 10)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget transactionFilter({
  required String title,
  required bool hasDivider,
  required Color textColor,
  double textSize = 14,
  required BuildContext context,
  required String imagePath,
  required bool isSelected,
}) {
  return Column(
    children: [
      Gap(Layout.getHeight(context, 22)),
      Padding(
        padding: EdgeInsets.only(left: Layout.getWidth(context, 25)),
        child: Row(
          children: [
            // right image
            Container(
              width: Layout.getWidth(context, 30),
              height: Layout.getHeight(context, 30),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imagePath, width: 20, height: 20),
              ),
            ),

            // text
            Gap(Layout.getWidth(context, 20)),
            Text(
              title,
              style: Styles.normalText(
                context,
              ).copyWith(color: textColor, fontSize: textSize),
            ),

            //
            const Spacer(),

            //
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Color(0xFFE8E8E8) : Color(0xFFE8E8E8),
                    width: 3,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 9,
                          height: 9,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(
                              0xFF3F2FBB, // inner dot
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ),
            ),
          ],
        ),
      ),
      Gap(Layout.getHeight(context, 22)),
      hasDivider
          ? Divider(
              height: Layout.getHeight(context, 0.5),
              color: const Color(0xFFEBEBEB),
            )
          : Container(),
    ],
  );
}
