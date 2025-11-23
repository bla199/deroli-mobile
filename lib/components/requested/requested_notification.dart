import 'package:deroli_mobile/components/general/dashed-border.dart';
import 'package:deroli_mobile/network/models/requests_modal.dart';
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
    String firstLetter = widget.payment.vendor.name.isNotEmpty
        ? widget.payment.vendor.name[0].toUpperCase()
        : 'A';
    int hash = firstLetter.codeUnitAt(0);
    return Color(0xFF000000 + (hash % 0xFFFFFF)).withOpacity(0.1);
  }

  String _getFirstLetter() {
    return widget.payment.vendor.name.isNotEmpty
        ? widget.payment.vendor.name[0].toUpperCase()
        : 'A';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  backgroundColor: widget.avatarColor ?? _getAvatarColor(),
                  child: Text(
                    widget.firstLetter ?? _getFirstLetter(),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                  fontSize: 14,
                                  color: Color(0xFF000000),
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        "${widget.payment.paymentId.toUpperCase().substring(0, widget.payment.paymentId.length > 6 ? 6 : widget.payment.paymentId.length)} ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              widget.payment.getFormattedTime().isEmpty
                                  ? DateTime.now().toString().substring(11, 16)
                                  : widget.payment.getFormattedTime(),
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
                                  fontSize: 14,
                                  color: Color(0xFF9A9A9A),
                                ),
                                children: [
                                  TextSpan(
                                    text: widget.payment.vendor.name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: "TZS ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF9A9A9A),
                                ),
                                children: [
                                  TextSpan(
                                    text: _formatAmount(widget.payment.amount),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
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
                            Text(
                              "For - ${widget.payment.category.name ?? 'N/A'}",
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.state ??
                                      widget.payment.status ??
                                      'Pending',
                                  style: TextStyle(
                                    color:
                                        widget.stateColor ??
                                        widget.payment.getStatusColor(),
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
            SizedBox(height: 10),
            DashedBorder(color: Color(0xFFDEDEDE)),
          ],
        ),
      ),
    );
  }
}
