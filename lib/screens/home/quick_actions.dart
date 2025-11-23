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
      padding: const EdgeInsets.only(top: 40.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                  width: 40,
                                ),
                                iconSize: 10,
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              Text("Retire", style: TextStyle(fontSize: 12)),
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
                                  width: 40,
                                ),
                                iconSize: 10,
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              Text("Invoice", style: TextStyle(fontSize: 12)),
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
                                  width: 40,
                                ),
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              Text("Requested", style: TextStyle(fontSize: 12)),
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
