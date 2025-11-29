import 'package:deroli_mobile/components/main.dart';
import 'package:deroli_mobile/components/general/general.dart';
import 'package:intl/intl.dart';
import 'package:deroli_mobile/models/project_modal.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/material.dart';
export 'requested_Notification.dart';

class RequestedNotification extends StatefulWidget {
  const RequestedNotification({
    super.key,
    required this.payment,
    this.avatarColor,
    this.firstLetter,
    this.state,
    this.stateColor,
  });

  final Payment payment;
  final Color? avatarColor;
  final String? firstLetter;
  final String? state;
  final Color? stateColor;
  @override
  State<RequestedNotification> createState() => _RequestedNotificationState();
}

class _RequestedNotificationState extends State<RequestedNotification> {
  String _formatAmount(String? amount) {
    if (amount == null || amount.isEmpty) return '0';
    try {
      double value = double.parse(amount);
      return value
          .toStringAsFixed(value == value.toInt() ? 0 : 2)
          .replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},',
          );
    } catch (e) {
      return amount;
    }
  }

  Color _getAvatarColor() {
    String firstLetter = widget.payment.vendor?.name.isNotEmpty ?? false
        ? widget.payment.vendor?.name[0].toUpperCase() ?? 'A'
        : 'A';
    int hash = firstLetter.codeUnitAt(0);
    return Color(0xFF000000 + (hash % 0xFFFFFF)).withOpacity(0.1);
  }

  String _getFirstLetter() {
    return widget.payment.vendor?.name.isNotEmpty ?? false
        ? widget.payment.vendor?.name[0].toUpperCase() ?? 'A'
        : 'A';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.only(left: Layout.getWidth(context, 20)),
        child: Column(
          children: [
            SizedBox(height: Layout.getHeight(context, 20)),
            Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  backgroundColor: widget.avatarColor ?? _getAvatarColor(),
                  child: Text(
                    widget.firstLetter ?? _getFirstLetter(),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: Layout.getHeight(context, 18),
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Layout.getWidth(context, 20),
                    ),
                    child: Column(
                      spacing: 6,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "REQ: ",
                                style: TextStyle(
                                  fontSize: Layout.getHeight(context, 13),
                                  color: Color(0xFF000000),
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        "${widget.payment.paymentId.toUpperCase().substring(0, widget.payment.paymentId.length > 6 ? 6 : widget.payment.paymentId.length)} ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: Layout.getHeight(context, 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              DateFormat('HH:mm a').format(
                                DateTime.parse(widget.payment.paymentDate),
                              ),
                              style: TextStyle(color: Color(0xFF9A9A9A)),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Vendor: ",
                                style: TextStyle(
                                  fontSize: Layout.getHeight(context, 13),
                                  color: Color(0xFF9A9A9A),
                                ),
                                children: [
                                  TextSpan(
                                    text: widget.payment.vendor?.name ?? '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: Layout.getHeight(context, 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: "TZS ",
                                style: TextStyle(
                                  fontSize: Layout.getHeight(context, 13),
                                  color: Color(0xFF9A9A9A),
                                ),
                                children: [
                                  TextSpan(
                                    text: _formatAmount(widget.payment.amount),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: Layout.getHeight(context, 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("For - ${widget.payment.category.name}"),
                            Column(
                              children: [
                                Text(
                                  widget.payment.status,
                                  style: TextStyle(
                                    color: getStatusColor(
                                      widget.payment.status,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Layout.getHeight(context, 10)),
            DashedBorder(color: Color(0xFFDEDEDE)),
          ],
        ),
      ),
    );
  }
}
