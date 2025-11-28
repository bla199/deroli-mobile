import 'package:deroli_mobile/components/retire/retire_requested_Notification.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/main.dart';
import '../../components/requested/requested_notification.dart';
import '../../network/services/getRequested.dart';
import '../../network/models/requests_modal.dart';

class Retire_Requested extends StatefulWidget {
  const Retire_Requested({super.key});

  @override
  State<Retire_Requested> createState() => Retire_RequestedState();
}

final SearchTextController = TextEditingController();

class Retire_RequestedState extends State<Retire_Requested> {
  List<Payment> paymentList = [];
  bool isLoading = true;
  String searchQuery = '';

  List<Payment> get _filteredList {
    if (searchQuery.isEmpty) return paymentList;
    return paymentList.where((payment) {
      return payment.vendor.name.toLowerCase().contains(
            searchQuery.toLowerCase(),
          ) ||
          payment.paymentId.toLowerCase().contains(searchQuery.toLowerCase()) ||
          (payment.category.name ?? '').toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        leading: Container(
          padding: EdgeInsets.only(left: 0),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),

            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: IconButton(
            onPressed: () {
              context.goNamed("activities");
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                // color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Image.asset(
                'assets/icons/Sort.png',
                width: 25,
                height: 25,
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0.0, top: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Requested',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(
                            color: Color(0xFF9A9A9A),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Loading or List
            Padding(
              padding: const EdgeInsets.all(.0),
              child: ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.only(bottom: 20.0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      context.pushNamed("full_retire_request_details");
                    },
                    child: RetireRequestedNotification(),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Text(
                    'Yesterday',
                    style: TextStyle(color: Color(0xFF9A9A9A), fontSize: 16),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            RetireRequestedNotification(),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFFFFFFF).withOpacity(0.1),
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: TextField(
            controller: SearchTextController,
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hint: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(children: [Icon(Icons.search), Text('Search')]),
              ),

              focusedBorder: null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(
                  color: Colors.white, // <-- normal border color
                  width: 1.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
