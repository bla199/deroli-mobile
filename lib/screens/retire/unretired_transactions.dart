import 'package:deroli_mobile/components/general/dashed-border.dart';
import 'package:deroli_mobile/components/main.dart';
import 'package:deroli_mobile/network/models/requests_modal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FullRequestDetails extends StatefulWidget {
  final Payment? payment;

  const FullRequestDetails({super.key, this.payment});

  @override
  State<FullRequestDetails> createState() => _FullRequestDetailsState();
}

class _FullRequestDetailsState extends State<FullRequestDetails> {
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

  Color _getAvatarColor(String name) {
    String firstLetter = name.isNotEmpty ? name[0].toUpperCase() : 'A';
    int hash = firstLetter.codeUnitAt(0);
    return Color(0xFF000000 + (hash % 0xFFFFFF)).withOpacity(0.1);
  }

  String _getFirstLetter(String name) {
    return name.isNotEmpty ? name[0].toUpperCase() : 'A';
  }

  String _getStatusText() {
    if (widget.payment == null) return 'Pending approval';
    final status = (widget.payment!.status ?? '').toLowerCase();
    switch (status) {
      case 'pending':
        return 'Pending approval';
      case 'approved':
        return 'Approved';
      case 'declined':
        return 'Declined';
      default:
        return 'Initialized';
    }
  }

  Color _getStatusColor() {
    if (widget.payment == null) return Color(0xFFE3B644);
    return widget.payment!.getStatusColor();
  }

  Color _getStatusBackgroundColor() {
    if (widget.payment == null) return Color(0xFFFFF9E9);
    final status = (widget.payment!.status ?? '').toLowerCase();
    switch (status) {
      case 'pending':
        return Color(0xFFFFF9E9);
      case 'approved':
        return Color(0xFFE8F5E9);
      case 'declined':
        return Color(0xFFFFEBEE);
      default:
        return Color(0xFFFFF9E9);
    }
  }

  @override
  Widget build(BuildContext context) {
    final payment = widget.payment;

    if (payment == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFF),
          leading: IconButton(
            onPressed: () {
              context.goNamed("requested");
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(child: Text('No payment details available')),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFF),
        leading: IconButton(
          onPressed: () {
            context.goNamed("requested");
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [Image.asset('assets/icons/Chat.png', width: 30, height: 30)],
        actionsPadding: EdgeInsets.only(right: 30),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 30),
                    child: Text(
                      'Request',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10,
                                  top: 12,
                                  bottom: 10,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF8F8F8),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/icons/Send.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Requested',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF787878),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text.rich(
                                  TextSpan(
                                    text: "TZS ",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF9A9A9A),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: _formatAmount(payment.amount),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      AppBorder(color: Color(0xFFEBEBEB)),
                      SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20,
                          bottom: 20,
                        ),
                        child: Column(
                          spacing: 15,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Requested Sent',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Text(
                                  payment.getFormattedDateTime(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    // fontWeight: FontWeight.w000,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'To be Approved by',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Text(
                                  '${payment.user.role.isNotEmpty ? payment.user.role[0].toUpperCase() + payment.user.role.substring(1) : ''}, ${payment.user.fullName}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    // fontWeight: FontWeight.w000,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: _getStatusBackgroundColor(),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0,
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      _getStatusText(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: _getStatusColor(),
                                        // fontWeight: FontWeight.w000,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10,
                                  top: 12,
                                  bottom: 10,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF8F8F8),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/icons/Group.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Payment To',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF787878),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                              ),
                            ],
                          ),
                        ],
                      ),

                      AppBorder(color: Color(0xFFEBEBEB)),
                      SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20,
                          bottom: 20,
                        ),
                        child: Column(
                          spacing: 15,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Vendor',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/circle_duotone.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      payment.vendor.name,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        // fontWeight: FontWeight.w000,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Payment method',

                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Text(
                                  payment
                                          .vendor
                                          .paymentAccount
                                          ?.provider
                                          ?.name ??
                                      'N/A',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    // fontWeight: FontWeight.w000,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Account Number',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    payment
                                            .vendor
                                            .paymentAccount
                                            ?.accountNumber ??
                                        'N/A',
                                    style: TextStyle(
                                      fontSize: 14,

                                      // fontWeight: FontWeight.w000,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Account Name',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    payment.vendor.paymentAccount?.name ??
                                        payment.vendor.name,
                                    style: TextStyle(
                                      fontSize: 14,

                                      // fontWeight: FontWeight.w000,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10,
                                  top: 12,
                                  bottom: 10,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF8F8F8),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/icons/Paper_alt_duotone_line.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Payment For',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF787878),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                              ),
                            ],
                          ),
                        ],
                      ),

                      AppBorder(color: Color(0xFFEBEBEB)),
                      SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20,
                          bottom: 20,
                        ),
                        child: Column(
                          spacing: 15,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  payment.category.name ?? 'N/A',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    // fontWeight: FontWeight.w000,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sub-category',

                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Text(
                                  payment.category.name ?? 'N/A',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    // fontWeight: FontWeight.w000,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    payment.category.name ?? 'N/A',
                                    style: TextStyle(
                                      fontSize: 14,

                                      // fontWeight: FontWeight.w000,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),

                //whole
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10,
                                  top: 12,
                                  bottom: 10,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF8F8F8),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),

                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/icons/File_dock.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Payment Purpose',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF787878),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/icons/Upload_dark.png',
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      AppBorder(color: Color(0xFFEBEBEB)),
                      SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20,
                          bottom: 20,
                        ),
                        child: Column(
                          spacing: 15,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFEEEE),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                      vertical: 4,
                                    ),
                                    child: Text(
                                      'Not uploaded',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFFF7072),
                                        // fontWeight: FontWeight.w000,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Padding(padding: EdgeInsetsGeometry.only(bottom: 20)),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
