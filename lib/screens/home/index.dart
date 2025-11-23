import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:deroli_mobile/screens/home/card.dart';
import 'package:deroli_mobile/screens/home/quick_actions.dart';
import 'package:deroli_mobile/screens/home/recent_activities.dart';
import 'package:deroli_mobile/screens/home/projects.dart';
import 'package:deroli_mobile/utils/layout.dart';
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
      backgroundColor: Color(0xFFF9F9F9),
      extendBody: true,

      //
      appBar: HeaderAppBar(
        horizotalPadding: 15,
        // actionsPadding: EdgeInsets.only(right: 20),
        backgroundColor: Color(0xFFF9F9F9),
        leading: IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xFFFFFFFF)),
          ),
          onPressed: null,
          icon: Image.asset('assets/icons/Person.png', width: 25, height: 25),
        ),

        actions: [
          IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(0xFFFFFFFF)),
            ),
            onPressed: null,
            icon: Image.asset(
              'assets/icons/Notification.png',
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),

      // body
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            // Centered filled button
            ProjectSelection(),

            // Pending request block
            HomeCard(),

            // Quick Actions
            QuickActions(),

            // recent activities
            RecentActivities(),

            SizedBox(height: Layout.getHeight(context, 60)),
          ],
        ),
      ),
    );
  }
}
