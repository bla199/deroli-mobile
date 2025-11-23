import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../components/main.dart';
import '../../network/services/getInvoices.dart';
import '../../network/models/Invoice_modal.dart';

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
      List<Object> data = await getInvoices();
      setState(() {
        invoiceList = data.cast<Invoice>();
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching invoices: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  List<Invoice> get _filteredList {
    if (searchQuery.isEmpty) return invoiceList;
    return invoiceList.where((invoice) {
      return invoice.invoiceNumber.toLowerCase().contains(
            searchQuery.toLowerCase(),
          ) ||
          invoice.invoiceCategory.toLowerCase().contains(
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

          // Loading or List
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : _filteredList.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        'No invoices created',
                        style: TextStyle(
                          color: Color(0xFF9A9A9A),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredList.length,
                    itemBuilder: (context, index) {
                      final invoice = _filteredList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    invoice.invoiceNumber,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    'TZS ${invoice.invoiceAmount}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                invoice.invoiceCategory,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF9A9A9A),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                invoice.invoiceDate,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF9A9A9A),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
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
