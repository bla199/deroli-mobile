import 'package:deroli_mobile/components/invoice/custom_bottom_navBar.dart';
import 'package:deroli_mobile/components/invoice/invoice_header_card.dart';
import 'package:deroli_mobile/components/invoice/invoice_to_section.dart';
import 'package:deroli_mobile/components/invoice/invoice_details_section.dart';
import 'package:deroli_mobile/components/invoice/invoice_activity_section.dart';
import 'package:deroli_mobile/components/invoice/invoice_items_section.dart';
import 'package:deroli_mobile/models/project_modal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FullInvoiceDetails extends StatefulWidget {
  const FullInvoiceDetails({super.key, this.payment});
  final Payment? payment;

  @override
  State<FullInvoiceDetails> createState() => _FullInvoiceDetailsState();
}

class _FullInvoiceDetailsState extends State<FullInvoiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFF),
        leading: IconButton(
          onPressed: () {
            context.goNamed("retire");
          },
          icon: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.arrow_back, size: 20),
              ),
            ),
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/icons/email_1.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.only(right: 30),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ---------------- INVOICE HEADER TITLE ----------------
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 30),
                    child: Text(
                      'Invoices',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),

              // ---------------- INVOICE CARD 1 ----------------
              const InvoiceHeaderCard(),

              const SizedBox(height: 50),

              // ---------------- INVOICE TO SECTION ----------------
              const InvoiceToSection(),

              const SizedBox(height: 50),

              // ---------------- DETAILS SECTION ----------------
              const InvoiceDetailsSection(),

              const SizedBox(height: 50),

              // ---------------- ACTIVITY SECTION ----------------
              const InvoiceActivitySection(),

              SizedBox(height: 50),

              //-------------INVOICE SECTION--------------------
              const InvoiceItemsSection(),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),

      bottomNavigationBar: InvoiceCustomBottomNavBar(
        selectedIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
