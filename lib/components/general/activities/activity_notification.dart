import 'package:deroli_mobile/utils/index.dart';
import 'package:deroli_mobile/models/project_modal.dart';
import 'package:flutter/material.dart';
export 'activity_notification.dart';

class ActivityNotification extends StatefulWidget {
  final Payment payment;

  const ActivityNotification({super.key, required this.payment});

  @override
  State<ActivityNotification> createState() => _ActivityNotificationState();
}

class _ActivityNotificationState extends State<ActivityNotification> {
  String _formatDate(String dateString) {
    if (dateString.isEmpty) return '';
    try {
      // Try to parse the date string
      final date = DateTime.parse(dateString);
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
      // If parsing fails, return the original string or a formatted version
      return dateString;
    }
  }

  String _formatTime(String timeString) {
    if (timeString.isEmpty) return '';
    try {
      // Try to parse time string (could be HH:mm:ss or HH:mm)
      final parts = timeString.split(':');
      if (parts.length >= 2) {
        return '${parts[0]}:${parts[1]}';
      }
      return timeString;
    } catch (e) {
      return timeString;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'initiated':
        return Color(0xFFE3B644);
      case 'completed':
        return Color(0xFF1C811E);
      case 'requested':
        return Color(0xFFE3B644);
      case 'pending':
        return Color(0xFFE3B644);
      case 'failed':
        return Color(0xFFFF7072);
      default:
        return Color(0xFF9A9A9A);
    }
  }

  String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  String _getVendorName() {
    if (widget.payment.vendor != null) {
      return _capitalizeFirst(widget.payment.vendor!.name);
    } else if (widget.payment.user != null) {
      final firstName = _capitalizeFirst(widget.payment.user!.firstName);
      final lastName = _capitalizeFirst(widget.payment.user!.lastName);
      return '$firstName $lastName';
    }
    return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    final payment = widget.payment;
    final vendorName = _getVendorName();
    final formattedDate = _formatDate(payment.paymentDate);
    final formattedTime = _formatTime(payment.paymentTime);
    final formattedAmount = Constants.commaValue(
      double.tryParse(payment.amount) ?? 0.0,
    );
    final statusColor = _getStatusColor(payment.status);

    return Padding(
      padding: EdgeInsets.only(top: Layout.getHeight(context, 15)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Layout.getWidth(context, 13),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: Layout.getWidth(context, 35),
                  height: Layout.getHeight(context, 35),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Image.asset('assets/icons/Send_1.png', width: 15),
                    iconSize: Layout.getHeight(context, 3),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Color(0xFFEAE7FF), width: 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Layout.getWidth(context, 10)),
                  child: SizedBox(
                    width: Layout.getWidth(context, 280),
                    child: Column(
                      spacing: Layout.getHeight(context, 1),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "To Pay - $vendorName",
                                style: TextStyle(
                                  fontSize: Layout.getHeight(context, 12),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                fontSize: Layout.getHeight(context, 12),
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
                                  WidgetSpan(
                                    child: Text(
                                      "TZS",
                                      style: TextStyle(
                                        fontSize: Layout.getHeight(context, 12),
                                        color: Colors.black38,
                                      ),
                                    ),
                                    baseline: TextBaseline.alphabetic,
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                  WidgetSpan(
                                    child: SizedBox(
                                      width: Layout.getWidth(context, 8),
                                    ),
                                  ),
                                  TextSpan(
                                    text: formattedAmount,
                                    style: TextStyle(
                                      fontFamily: 'FredokaBold',
                                      fontSize: Layout.getHeight(context, 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              formattedTime,
                              style: TextStyle(
                                fontSize: Layout.getHeight(context, 12),
                                color: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              payment.status,
                              style: TextStyle(
                                fontSize: Layout.getHeight(context, 12),
                                color: statusColor,
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
          ),
        ],
      ),
    );
  }
}
