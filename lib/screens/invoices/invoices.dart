import 'package:deroli_mobile/components/invoices/invoice_notification.dart';
import 'package:deroli_mobile/network/models/Invoice_modal.dart';
import 'package:deroli_mobile/network/services/getInvoices.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/main.dart';

class Invoices extends StatefulWidget {
  const Invoices({super.key});

  @override
  State<Invoices> createState() => _InvoicesState();
}

final SearchTextController = TextEditingController();

class _InvoicesState extends State<Invoices> {
  List<Invoice> invoiceList = [];
  bool isLoading = true;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchInvoices();
  }

  Future<void> _fetchInvoices() async {
    setState(() {
      isLoading = true;
    });
    try {
      List<Invoice> data = await getInvoices();

      print("INVOICES: ${data.length}");
      for (var invoice in data) {
        print("invoice: ${invoice.invoiceNumber}");
      }
      setState(() {
        invoiceList = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching invoices: $e");
      setState(() {
        isLoading = false;
      });
    }
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

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Invoices',
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
          SizedBox(height: 5),
          AppBorder(color: Color(0xFFEBEBEB)),

          // SizedBox(height: 30),
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(color: Color(0xFF312684)),
                  )
                : invoiceList.isEmpty
                ? Center(child: Text('No invoices found'))
                : ListView.builder(
                    itemCount: invoiceList.length,
                    itemBuilder: (context, index) {
                      return InvoiceNotification(invoice: invoiceList[index]);
                    },
                  ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFFFFFFF).withOpacity(0.1),
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: TextField(
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
