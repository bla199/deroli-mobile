import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:deroli_mobile/components/main.dart';
import 'package:deroli_mobile/models/project_modal.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FullRequestDetailsScreen extends StatefulWidget {
  final Payment payment;

  const FullRequestDetailsScreen({super.key, required this.payment});

  @override
  State<FullRequestDetailsScreen> createState() =>
      _FullRequestDetailsScreenState();
}

class _FullRequestDetailsScreenState extends State<FullRequestDetailsScreen> {
  String _getStatusText() {
    final status = (widget.payment.status.toLowerCase()).toLowerCase();
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
    return widget.payment.status.toLowerCase() == 'pending'
        ? Color(0xFFE3B644)
        : widget.payment.status.toLowerCase() == 'approved'
        ? Color(0xFF4CAF50)
        : widget.payment.status.toLowerCase() == 'initialized'
        ? Color(0xFFE3B644)
        : Color(0xFFE3B644);
  }

  Color _getStatusBackgroundColor() {
    final status = (widget.payment.status.toLowerCase()).toLowerCase();
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

  late Size screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = Layout.getSize(context);
  }

  @override
  Widget build(BuildContext context) {
    final payment = widget.payment;
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
              'assets/icons/Chat.png',
              width: Layout.getWidth(context, 25),
              height: Layout.getHeight(context, 25),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Layout.getWidth(context, 0)),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: Layout.getWidth(context, 20),
                      bottom: Layout.getHeight(context, 30),
                    ),
                    child: Text(
                      'Request',
                      style: Styles.header(context).copyWith(
                        fontSize: Layout.getHeight(context, 20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Layout.getWidth(context, 20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Layout.getHeight(context, 20)),
                    ),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: Layout.getWidth(context, 10),
                                  right: Layout.getWidth(context, 10),
                                  top: Layout.getHeight(context, 12),
                                  bottom: Layout.getHeight(context, 10),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF8F8F8),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            Layout.getHeight(context, 20),
                                          ),
                                        ),
                                      ),

                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          Layout.getWidth(context, 8),
                                        ),
                                        child: Image.asset(
                                          'assets/icons/Send.png',
                                          width: Layout.getWidth(context, 20),
                                          height: Layout.getHeight(context, 20),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: Layout.getWidth(context, 8),
                                      ),
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
                                padding: EdgeInsets.only(
                                  right: Layout.getWidth(context, 20),
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    text: "TZS ",
                                    style: Styles.normalText(context).copyWith(
                                      fontSize: Layout.getHeight(context, 14),
                                      color: Color(0xFF9A9A9A),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: Constants.commaValue(
                                          double.parse(payment.amount),
                                        ),
                                        style: Styles.normalText(context)
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Layout.getHeight(
                                                context,
                                                16,
                                              ),
                                              color: Colors.black,
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
                      SizedBox(height: Layout.getHeight(context, 10)),

                      Padding(
                        padding: EdgeInsets.only(
                          left: Layout.getWidth(context, 20),
                          right: Layout.getWidth(context, 20),
                          bottom: Layout.getHeight(context, 20),
                        ),
                        child: Column(
                          spacing: Layout.getHeight(context, 15),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Requested Sent',
                                  style: Styles.normalText(context).copyWith(
                                    fontSize: Layout.getHeight(context, 14),
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Text(
                                  DateFormat(
                                    'dd MMM yyyy, HH:mm',
                                  ).format(DateTime.parse(payment.paymentDate)),
                                  style: Styles.normalText(context).copyWith(
                                    fontSize: Layout.getHeight(context, 14),
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
                                  style: Styles.normalText(context).copyWith(
                                    fontSize: Layout.getHeight(context, 14),
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Text(
                                  '${payment.user?.role.isNotEmpty ?? false ? payment.user?.role[0].toUpperCase() ?? payment.user!.role.substring(1) : ''}, ${payment.user?.firstName ?? ''} ${payment.user?.lastName ?? ''}',
                                  style: Styles.normalText(context).copyWith(
                                    fontSize: Layout.getHeight(context, 14),
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
                                  style: Styles.normalText(context).copyWith(
                                    fontSize: Layout.getHeight(context, 14),
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        Layout.getHeight(context, 20),
                                      ),
                                    ),
                                    color: _getStatusBackgroundColor(),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Layout.getWidth(context, 14),
                                      vertical: Layout.getHeight(context, 2),
                                    ),
                                    child: Text(
                                      _getStatusText(),
                                      style: Styles.normalText(context)
                                          .copyWith(
                                            fontSize: Layout.getHeight(
                                              context,
                                              12,
                                            ),
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

              SizedBox(height: Layout.getHeight(context, 50)),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Layout.getWidth(context, 20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Layout.getHeight(context, 20)),
                    ),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: Layout.getWidth(context, 10),
                                  right: Layout.getWidth(context, 10),
                                  top: Layout.getHeight(context, 12),
                                  bottom: Layout.getHeight(context, 10),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF8F8F8),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            Layout.getHeight(context, 20),
                                          ),
                                        ),
                                      ),

                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          Layout.getWidth(context, 8),
                                        ),
                                        child: Image.asset(
                                          'assets/icons/Group.png',
                                          width: Layout.getWidth(context, 20),
                                          height: Layout.getHeight(context, 20),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: Layout.getWidth(context, 8),
                                      ),
                                      child: Text(
                                        'Payment To',
                                        style: TextStyle(
                                          fontSize: Layout.getHeight(
                                            context,
                                            14,
                                          ),
                                          color: Color(0xFF787878),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                  right: Layout.getWidth(context, 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      AppBorder(color: Color(0xFFEBEBEB)),
                      SizedBox(height: Layout.getHeight(context, 10)),

                      Padding(
                        padding: EdgeInsets.only(
                          left: Layout.getWidth(context, 20),
                          right: Layout.getWidth(context, 20),
                          bottom: Layout.getHeight(context, 20),
                        ),
                        child: Column(
                          spacing: Layout.getHeight(context, 15),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Vendor',
                                  style: Styles.normalText(context).copyWith(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/circle_duotone.png',
                                      width: Layout.getWidth(context, 40),
                                      height: Layout.getHeight(context, 40),
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      payment.vendor?.name ?? '',
                                      style: Styles.normalText(context)
                                          .copyWith(
                                            fontSize: Layout.getHeight(
                                              context,
                                              14,
                                            ),
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

                                  style: Styles.normalText(context).copyWith(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Text(
                                  payment
                                          .vendor
                                          ?.paymentAccount
                                          ?.provider
                                          .name ??
                                      'N/A',
                                  style: Styles.normalText(context).copyWith(
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
                                  style: Styles.normalText(context).copyWith(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        Layout.getHeight(context, 20),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    payment
                                            .vendor
                                            ?.paymentAccount
                                            ?.accountNumber ??
                                        'N/A',
                                    style: Styles.normalText(context).copyWith(
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
                                  style: Styles.normalText(context).copyWith(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        Layout.getHeight(context, 20),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    payment.vendor?.paymentAccount?.name ??
                                        payment.vendor?.name ??
                                        '',
                                    style: Styles.normalText(context).copyWith(
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

              SizedBox(height: Layout.getHeight(context, 50)),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Layout.getWidth(context, 20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Layout.getHeight(context, 20)),
                    ),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: Layout.getWidth(context, 10),
                                  right: Layout.getWidth(context, 10),
                                  top: Layout.getHeight(context, 12),
                                  bottom: Layout.getHeight(context, 10),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF8F8F8),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            Layout.getHeight(context, 20),
                                          ),
                                        ),
                                      ),

                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          Layout.getWidth(context, 8),
                                        ),
                                        child: Image.asset(
                                          'assets/icons/Paper_alt_duotone_line.png',
                                          width: Layout.getWidth(context, 20),
                                          height: Layout.getHeight(context, 20),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: Layout.getWidth(context, 8),
                                      ),
                                      child: Text(
                                        'Payment For',
                                        style: TextStyle(
                                          fontSize: Layout.getHeight(
                                            context,
                                            14,
                                          ),
                                          color: Color(0xFF787878),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                  right: Layout.getWidth(context, 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      AppBorder(color: Color(0xFFEBEBEB)),
                      SizedBox(height: Layout.getHeight(context, 10)),

                      Padding(
                        padding: EdgeInsets.only(
                          left: Layout.getWidth(context, 20),
                          right: Layout.getWidth(context, 20),
                          bottom: Layout.getHeight(context, 20),
                        ),
                        child: Column(
                          spacing: Layout.getHeight(context, 15),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Category',
                                  style: Styles.normalText(context).copyWith(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  payment.category.name,
                                  style: Styles.normalText(context).copyWith(
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

                                  style: Styles.normalText(context).copyWith(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Text(
                                  payment.subProject?.name ?? '',
                                  style: Styles.normalText(context).copyWith(
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
                                  style: Styles.normalText(context).copyWith(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        Layout.getHeight(context, 20),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "${payment.category.name} - ${payment.subProject?.name ?? ''}",
                                    style: Styles.normalText(context).copyWith(
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

              SizedBox(height: Layout.getHeight(context, 50)),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Layout.getWidth(context, 20),
                ),

                //whole
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Layout.getHeight(context, 20)),
                    ),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: Layout.getWidth(context, 10),
                                  right: Layout.getWidth(context, 10),
                                  top: Layout.getHeight(context, 12),
                                  bottom: Layout.getHeight(context, 10),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF8F8F8),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            Layout.getHeight(context, 20),
                                          ),
                                        ),
                                      ),

                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          Layout.getWidth(context, 8),
                                        ),
                                        child: Image.asset(
                                          'assets/icons/File_dock.png',
                                          width: Layout.getWidth(context, 20),
                                          height: Layout.getHeight(context, 20),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: Layout.getWidth(context, 8),
                                      ),
                                      child: Text(
                                        'Payment Purpose',
                                        style: TextStyle(
                                          fontSize: Layout.getHeight(
                                            context,
                                            14,
                                          ),
                                          color: Color(0xFF787878),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                  right: Layout.getWidth(context, 20),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/icons/Upload_dark.png',
                                      height: Layout.getHeight(context, 20),
                                      width: Layout.getWidth(context, 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      AppBorder(color: Color(0xFFEBEBEB)),
                      SizedBox(height: Layout.getHeight(context, 10)),

                      Padding(
                        padding: EdgeInsets.only(
                          left: Layout.getWidth(context, 20),
                          right: Layout.getWidth(context, 20),
                          bottom: Layout.getHeight(context, 20),
                        ),
                        child: Column(
                          spacing: Layout.getHeight(context, 15),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style: Styles.normalText(context).copyWith(
                                    fontSize: 14,
                                    color: Color(0xFF787878),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFEEEE),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        Layout.getHeight(context, 12),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Layout.getWidth(context, 15),
                                      vertical: Layout.getHeight(context, 4),
                                    ),
                                    child: Text(
                                      'Not uploaded',
                                      style: Styles.normalText(context)
                                          .copyWith(
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

              SizedBox(height: Layout.getHeight(context, 100)),
            ],
          ),
        ),
      ),
    );
  }
}
