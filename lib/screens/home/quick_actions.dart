import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuickActions extends StatefulWidget {
  const QuickActions({super.key});

  @override
  State<QuickActions> createState() => _QuickActionsState();
}

class _QuickActionsState extends State<QuickActions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Layout.getHeight(context, 50)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Layout.getWidth(context, 30)),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Quick Actions",
                style: TextStyle(fontSize: Layout.getHeight(context, 14)),
              ),
              Padding(
                padding: EdgeInsets.only(top: Layout.getHeight(context, 10)),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                  ),

                  child: Padding(
                    padding: EdgeInsets.all(Layout.getHeight(context, 10)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Layout.getWidth(context, 20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                color: Color(0xFFEAE7FF),
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/icons/Upload.png',
                                  width: 20,
                                ),
                                iconSize: 10,
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: Color(0xFFEAE7FF),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Retire",
                                style: TextStyle(
                                  fontSize: Layout.getHeight(context, 12),
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              IconButton(
                                color: Color(0xFFEAE7FF),
                                onPressed: () {
                                  context.goNamed("invoice");
                                },
                                icon: Image.asset(
                                  'assets/icons/Paper.png',
                                  width: 20,
                                ),
                                iconSize: 10,
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: Color(0xFFEAE7FF),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Invoice",
                                style: TextStyle(
                                  fontSize: Layout.getHeight(context, 12),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.pushNamed("requested");
                                },
                                icon: Image.asset(
                                  'assets/icons/Send_1.png',
                                  width: 20,
                                ),
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: Color(0xFFEAE7FF),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Requested",
                                style: TextStyle(
                                  fontSize: Layout.getHeight(context, 12),
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
          ),
        ),
      ),
    );
  }
}
