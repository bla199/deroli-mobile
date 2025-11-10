import 'package:flutter/material.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(20.0),
          child: IconButton(
            onPressed: null,
            icon: Icon(Icons.person, size: 30),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.notifications, size: 30),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Centered filled button
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.apps_outlined),
                    SizedBox(width: 10),
                    Text("All Projects"),
                    SizedBox(width: 6),
                    Icon(
                      Icons.arrow_drop_down,
                    ), // plain Icon -> no extra padding
                  ],
                ),
              ),
            ),
          ),

          // Pending request block
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                                  child: const Text(
                                    "TZS",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  alignment: PlaceholderAlignment.aboveBaseline,
                                  baseline: TextBaseline.alphabetic,
                                ),
                                const WidgetSpan(child: SizedBox(width: 8)),
                                const TextSpan(
                                  text: "200,000",
                                  style: TextStyle(
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
                              style: ButtonStyle(),
                              onPressed: () {},
                              child: Row(
                                spacing: 10,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.send),
                                  Text("Request Money"),
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
                    Text("Quick Actions"),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
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
                                    onPressed: () {},
                                    icon: Icon(Icons.send, size: 18),
                                    style: IconButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  Text("Retire"),
                                ],
                              ),

                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.document_scanner,
                                      size: 18,
                                    ),
                                    style: IconButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  Text("Invoice"),
                                ],
                              ),

                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.send, size: 18),
                                    style: IconButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  Text("Request"),
                                ],
                              ),
                            ],
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
            padding: const EdgeInsets.all(30.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Activities"),
                  IconButton(onPressed: () {}, icon: Icon(Icons.golf_course)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
