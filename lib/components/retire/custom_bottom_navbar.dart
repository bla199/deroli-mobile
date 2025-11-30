import 'package:deroli_mobile/models/project_modal.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Payment payment;

  const CustomBottomNavBar({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: Layout.getHeight(context, 40),
        top: Layout.getHeight(context, 15),
        left: Layout.getWidth(context, 20),
        right: Layout.getWidth(context, 20),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          if (payment.status != "Initiated")
            Expanded(
              child: DottedBorder(
                color: Color(0xFF7F7F7F),
                borderType: BorderType.RRect,
                radius: Radius.circular(6),
                dashPattern: [2, 3],
                padding: EdgeInsets.zero,
                child: FilledButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: Layout.getWidth(context, 18),
                        vertical: Layout.getHeight(context, 12),
                      ),
                    ),
                    minimumSize: WidgetStatePropertyAll(Size.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: WidgetStatePropertyAll(Color(0xFFF1F1F1)),
                  ),
                  onPressed: () {},
                  child: Row(
                    spacing: Layout.getWidth(context, 10),
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        payment.retireReceipt != null
                            ? 'assets/icons/download_up.png'
                            : 'assets/icons/download.png',
                        width: Layout.getWidth(context, 24),
                        color: Color(0xFF000000),
                      ),
                      Text(
                        payment.retireReceipt != null
                            ? "Retire transaction"
                            : "Download retire",
                        style: TextStyle(
                          fontSize: Layout.getHeight(context, 14),
                          color: Color(0xFF7F7F7F),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (payment.status != "Initiated") Gap(Layout.getWidth(context, 20)),

          Expanded(
            child: FilledButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: Layout.getWidth(context, 18),
                    vertical: Layout.getHeight(context, 12),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(Color(0xFF312684)),
                minimumSize: WidgetStatePropertyAll(Size.zero),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
              child: Row(
                spacing: Layout.getWidth(context, 10),
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    payment.status != "Initiated"
                        ? 'assets/icons/download.png'
                        : 'assets/icons/Send_2.png',
                    width: Layout.getWidth(
                      context,
                      payment.status != "Initiated" ? 24 : 15,
                    ),
                    color: Color(0xFFFFFFFF),
                  ),
                  Text(
                    payment.status != "Initiated"
                        ? "Payment receipt"
                        : "Approve payment",
                    style: TextStyle(
                      fontSize: Layout.getHeight(context, 14),
                      color: Color(0xFFD8D6FF),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
