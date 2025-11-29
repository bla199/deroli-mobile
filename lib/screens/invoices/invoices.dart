import 'package:deroli_mobile/components/invoice/invoice_notification.dart';
import 'package:deroli_mobile/components/invoice/invoice_notification_filter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/main.dart';

class Invoices extends StatefulWidget {
  const Invoices({super.key});

  @override
  State<Invoices> createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  final SearchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        leading: Container(
          margin: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            onPressed: () => context.goNamed("activities"),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Invoices',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const InvoiceFilter(),
          ),

          // -------------------- SCROLLABLE CONTENT --------------------
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 10),

                // TODAY LABEL
                const Text(
                  'Today',
                  style: TextStyle(color: Color(0xFF9A9A9A), fontSize: 16),
                ),

                const SizedBox(height: 15),

                // TODAY LIST
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.pushNamed("full_invoice_details");
                      },
                      child: const InvoiceNotification(),
                    );
                  },
                ),

                const SizedBox(height: 25),

                // YESTERDAY LABEL
                const Text(
                  'Yesterday',
                  style: TextStyle(color: Color(0xFF9A9A9A), fontSize: 16),
                ),
                const SizedBox(height: 10),

                // YESTERDAY SINGLE ITEM
                const InvoiceNotification(),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.white.withOpacity(0.1),
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: SearchTextController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hint: Row(
                children: const [
                  Icon(Icons.search, size: 20),
                  SizedBox(width: 10),
                  Text('Search'),
                ],
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 1.2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white, width: 1.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
