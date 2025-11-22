import 'package:deroli_mobile/components/general/dashed-border.dart';
import 'package:deroli_mobile/components/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FullRequestDetails extends StatefulWidget {
  const FullRequestDetails({super.key});

  @override
  State<FullRequestDetails> createState() => _FullRequestDetailsState();
}

class _FullRequestDetailsState extends State<FullRequestDetails> {
  @override
  Widget build(BuildContext context) {
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
                                        text: "300,098",
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
                                  'Today, 17:28',
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
                                  'CFO, Prosper Deroli',
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
                                    color: Color(0xFFFFF9E9),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0,
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      'Pending approval',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFE3B644),
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
                                      width: 35,
                                      height: 35,
                                    ),
                                    Text(
                                      'Fen Marketing Agency',
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
                                  'Bank Transfer',
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
                                    '0146362662',
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
                                    'Fen Company Limited',
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
                                  'Transport',
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
                                  'Admin Transport fees',
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
                                    'Fuel fees for proc and dessy',
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
