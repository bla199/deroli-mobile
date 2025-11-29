import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:deroli_mobile/controller/projects.dart';
import 'package:deroli_mobile/services/get_project.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../components/main.dart';
import '../../components/requested/requested_notification.dart';
import '../../models/project_modal.dart';

class Requested extends StatefulWidget {
  const Requested({super.key});

  @override
  State<Requested> createState() => _RequestedState();
}

final TextEditingController searchTextController = TextEditingController();

class _RequestedState extends State<Requested> {
  @override
  void initState() {
    // debt manager
    final projectsController = Provider.of<ProjectsController>(
      context,
      listen: false,
    );

    // pull debt transactions
    getRequestedPayments(
      context: context,
      projectsController: projectsController,
    );

    super.initState();
  }

  String formatDate(String dateString) {
    if (dateString.isEmpty) return '';
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = today.subtract(const Duration(days: 1));
      final dateOnly = DateTime(date.year, date.month, date.day);

      // Check if it's today
      if (dateOnly == today) {
        return 'Today';
      }
      // Check if it's yesterday
      if (dateOnly == yesterday) {
        return 'Yesterday';
      }

      // Otherwise, format as usual
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${months[date.month - 1]} ${date.day}, ${date.year}';
    } catch (e) {
      return dateString;
    }
  }

  late Size screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = Layout.getSize(context);
  }

  @override
  Widget build(BuildContext context) {
    //
    final projectsController = Provider.of<ProjectsController>(context);

    return Scaffold(
      //
      backgroundColor: Color(0xFFF9F9F9),
      //
      appBar: HeaderAppBar(
        title: "",
        isCentered: true,
        titleFontFamily: 'Trap',
        titleFontSize: 16,
        titleFontWeight: FontWeight.w600,
        backgroundColor: Color(0xFFF9F9F9),
        leadingWidth: screenSize.width * 0.1,
        horizotalPadding: 20,
        leading: Container(
          padding: EdgeInsets.only(left: 0),
          width: Layout.getWidth(context, 20),
          height: Layout.getHeight(context, 20),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),

            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        actions: [
          Container(
            width: Layout.getWidth(context, 30),
            height: Layout.getHeight(context, 30),
            decoration: BoxDecoration(
              // color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Image.asset(
              'assets/icons/Sort.png',
              width: Layout.getWidth(context, 25),
              height: Layout.getHeight(context, 25),
            ),
          ),
        ],
      ),

      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          //
          Padding(
            padding: EdgeInsets.only(
              left: Layout.getWidth(context, Layout.getWidth(context, 20)),
              top: Layout.getHeight(context, Layout.getHeight(context, 8)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Requested',
                      style: Styles.header(context).copyWith(
                        fontSize: Layout.getHeight(context, 20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: Layout.getHeight(context, Layout.getHeight(context, 5)),
          ),

          // Loading or List
          if (projectsController.getRequestedPaymentsLoading &&
              projectsController.requestedPayments.isEmpty)
            Padding(
              padding: EdgeInsets.only(
                top: Layout.getHeight(context, Layout.getHeight(context, 100)),
              ),
              child: Center(
                child: CupertinoActivityIndicator(
                  radius: Layout.getHeight(
                    context,
                    Layout.getHeight(context, 15),
                  ),
                  color: const Color(0xFF312684),
                ),
              ),
            ),
          if (projectsController.requestedPayments.isEmpty &&
              !projectsController.getRequestedPaymentsLoading)
            Center(
              child: Padding(
                padding: EdgeInsets.all(Layout.getWidth(context, 40)),
                child: Text(
                  'No payments found',
                  style: TextStyle(
                    color: Color(0xFF9A9A9A),
                    fontSize: Layout.getHeight(
                      context,
                      Layout.getHeight(context, 16),
                    ),
                  ),
                ),
              ),
            ),

          if (projectsController.requestedPayments.isNotEmpty)
            Builder(
              builder: (context) {
                // Group payments by date
                final groupedPayments = groupBy(
                  projectsController.requestedPayments,
                  (Payment payment) {
                    try {
                      // Try to use paymentDate first, fallback to date
                      final dateString = payment.paymentDate.isNotEmpty
                          ? payment.paymentDate
                          : payment.date;
                      return DateFormat(
                        'yyyy-MM-dd',
                      ).format(DateTime.parse(dateString));
                    } catch (e) {
                      // If parsing fails, use a default date
                      return DateFormat('yyyy-MM-dd').format(DateTime.now());
                    }
                  },
                );

                // Sort entries by date (most recent first)
                final sortedEntries = groupedPayments.entries.toList()
                  ..sort((a, b) => b.key.compareTo(a.key));

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: sortedEntries.map((entry) {
                    final date = entry.key;
                    final paymentsOnDate = entry.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display the date as a header
                        Padding(
                          padding: EdgeInsets.only(
                            left: Layout.getWidth(context, 20),
                            top: Layout.getHeight(context, 20),
                            bottom: Layout.getHeight(context, 0),
                          ),
                          child: AutoSizeText(
                            formatDate(date),
                            style: Styles.headerMain(context).copyWith(
                              fontSize: Layout.getHeight(context, 12.5),
                              color: Color(0xFF9A9A9A),
                            ),
                          ),
                        ),
                        // Display the payments for the date
                        ...paymentsOnDate.map((payment) {
                          return InkWell(
                            key: ValueKey(payment.paymentId),
                            onTap: () {
                              context.pushNamed(
                                "full_request_details",
                                extra: payment,
                              );
                            },
                            child: RequestedNotification(payment: payment),
                          );
                        }),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFFFFFFF).withOpacity(0.1),
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: TextField(
            controller: searchTextController,
            onChanged: (value) {
              setState(() {
                searchTextController.text = value;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hint: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(children: [Icon(Icons.search), Text('Search')]),
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(
                  color: Colors.white, // <-- normal border color
                  width: 1.2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(
                  color: Colors.white, // <-- normal border color
                  width: 1.2,
                ),
              ),
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
