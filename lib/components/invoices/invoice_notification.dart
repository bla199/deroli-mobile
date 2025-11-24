import 'package:deroli_mobile/components/general/dashed-border.dart';
import 'package:deroli_mobile/network/models/Invoice_modal.dart';
import 'package:flutter/material.dart';
export 'invoice_notification.dart';

class InvoiceNotification extends StatefulWidget {
  const InvoiceNotification({
    super.key,
    required this.invoice,
    this.avatarColor,
    this.firstLetter,
    this.state,
    this.stateColor,
  });

  final Invoice invoice;
  final Color? avatarColor;
  final String? firstLetter;
  final String? state;
  final Color? stateColor;
  @override
  State<InvoiceNotification> createState() => _InvoiceNotificationState();
}

class _InvoiceNotificationState extends State<InvoiceNotification> {
  String _formatAmount(double amount) {
    try {
      return amount
          .toStringAsFixed(amount == amount.toInt() ? 0 : 2)
          .replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},',
          );
    } catch (e) {
      return amount.toString();
    }
  }

  Color _getAvatarColor() {
    String firstLetter = widget.invoice.client.name.isNotEmpty
        ? widget.invoice.client.name[0].toUpperCase()
        : 'A';
    int hash = firstLetter.codeUnitAt(0);
    return Color(0xFF000000 + (hash % 0xFFFFFF)).withOpacity(0.1);
  }

  String _getFirstLetter() {
    return widget.invoice.user.firstName.isNotEmpty
        ? widget.invoice.user.firstName[0].toUpperCase()
        : 'A';
  }

  String _getFormattedTime() {
    if (widget.invoice.issueDate.isEmpty) {
      return DateTime.now().toString().substring(11, 16);
    }
    try {
      DateTime dateTime = DateTime.parse(widget.invoice.issueDate);
      return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      if (widget.invoice.issueDate.contains('T') &&
          widget.invoice.issueDate.length > 16) {
        return widget.invoice.issueDate.substring(11, 16);
      }
      return DateTime.now().toString().substring(11, 16);
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = widget.invoice.getTotalAmount();

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
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
                                text: "INV: ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF000000),
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        widget.invoice.invoiceNumber.length > 3
                                        ? widget.invoice.invoiceNumber
                                              .substring(3)
                                        : widget.invoice.invoiceNumber,
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
                              _getFormattedTime(),
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
                                    text:
                                        "${widget.invoice.user.firstName[0].toUpperCase()}${widget.invoice.user.firstName.substring(1)}",

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
                                    text: _formatAmount(totalAmount),
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
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "For - ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),

                                  TextSpan(
                                    text: widget.invoice.items.first.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],

                                // "For - ${widget.invoice.items.first.name}",
                                // style: TextStyle(
                                //   fontSize: 14,
                                // color: Colors.black38,
                              ),
                            ),

                            Text(
                              "Pending",
                              style: TextStyle(
                                color: Color(0xFFE3B644),
                                fontSize: 14,
                              ),
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
