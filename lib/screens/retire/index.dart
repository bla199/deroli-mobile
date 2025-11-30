import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:deroli_mobile/components/retire/retire_requested_notification.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../models/project_modal.dart';
import '../../controller/index.dart';

class Retire extends StatefulWidget {
  const Retire({super.key});

  @override
  State<Retire> createState() => RetireState();
}

final searchTextController = TextEditingController();

class RetireState extends State<Retire> {
  List<Payment> paymentList = [];
  bool isLoading = true;
  String searchQuery = '';

  late Size screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = Layout.getSize(context);
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

  @override
  Widget build(BuildContext context) {
    final projectsController = Provider.of<ProjectsController>(context);

    // Get all payments from all projects
    final allPayments = projectsController.getProjects
        .expand((project) => project.payments)
        .toList();

    // Filter payments without retireReceipt and with status Completed or Success
    final unretiredPayments = allPayments
        .where(
          (payment) =>
              (payment.retireReceipt == null ||
                  payment.retireReceipt!.isEmpty) &&
              (payment.status.toLowerCase() == 'completed' ||
                  payment.status.toLowerCase() == 'success'),
        )
        .toList();

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

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Layout.getWidth(context, 20)),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 0.0,
                top: Layout.getHeight(context, 8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Retire',
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
            SizedBox(height: Layout.getHeight(context, 10)),

            // Loading or List
            if (projectsController.getProjectsLoading &&
                unretiredPayments.isEmpty)
              Padding(
                padding: EdgeInsets.only(top: Layout.getHeight(context, 100)),
                child: Center(
                  child: CupertinoActivityIndicator(
                    radius: Layout.getHeight(context, 15),
                    color: const Color(0xFF312684),
                  ),
                ),
              ),
            if (unretiredPayments.isEmpty &&
                !projectsController.getProjectsLoading)
              Center(
                child: Padding(
                  padding: EdgeInsets.all(Layout.getWidth(context, 40)),
                  child: Text(
                    'No payments found',
                    style: TextStyle(
                      color: Color(0xFF9A9A9A),
                      fontSize: Layout.getHeight(context, 16),
                    ),
                  ),
                ),
              ),

            if (unretiredPayments.isNotEmpty)
              Builder(
                builder: (context) {
                  // Group payments by date
                  final groupedPayments = groupBy(unretiredPayments, (
                    Payment payment,
                  ) {
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
                  });

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
                              top: Layout.getHeight(context, 20),
                              bottom: Layout.getHeight(context, 0),
                            ),
                            child: Row(
                              children: [
                                AutoSizeText(
                                  formatDate(date),
                                  style: Styles.normalText(context).copyWith(
                                    color: Color(0xFF9A9A9A),
                                    fontSize: Layout.getHeight(context, 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Layout.getHeight(context, 10)),
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
                              child: RetireRequestedNotification(
                                payment: payment,
                              ),
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
      ),

      // bottomNavigationBar: BottomAppBar(
      //   color: Color(0xFFFFFFFF).withOpacity(0.1),
      //   height: Layout.getHeight(context, 70),
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(
      //       horizontal: Layout.getWidth(context, 0),
      //     ),
      //     child: TextField(
      //       controller: searchTextController,
      //       onChanged: (value) {
      //         setState(() {
      //           searchQuery = value;
      //         });
      //       },
      //       decoration: InputDecoration(
      //         filled: true,
      //         fillColor: Colors.transparent,
      //         hint: Padding(
      //           padding: EdgeInsets.symmetric(
      //             horizontal: Layout.getWidth(context, 0),
      //           ),
      //           child: Row(children: [Icon(Icons.search), Text('Search')]),
      //         ),

      //         focusedBorder: null,
      //         enabledBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.all(Radius.circular(30)),
      //           borderSide: BorderSide(
      //             color: Colors.white, // <-- normal border color
      //             width: 1.2,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
