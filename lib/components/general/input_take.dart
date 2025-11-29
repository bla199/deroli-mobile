import 'package:flutter/material.dart';
import 'package:deroli_mobile/utils/index.dart';
export 'input_take.dart';

class OptionItem {
  final String label;
  final String description;

  OptionItem({required this.label, required this.description});
}

class InputTake extends StatefulWidget {
  final String placeholder;
  final String descrp;
  final String title;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;
  final String icon;

  const InputTake({
    super.key,
    required this.title,
    this.label = "",
    this.descrp = "",
    this.placeholder = "",
    required this.onTap,
    required this.isSelected,
    required this.icon,
  });

  @override
  State<InputTake> createState() => _InputTakeState();
}

class _InputTakeState extends State<InputTake> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            widget.title,
            style: Styles.normalText(context).copyWith(fontSize: 13),
          ),
          SizedBox(height: Layout.getHeight(context, 8)),

          // Input Row
          InkWell(
            onTap: widget.onTap,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Layout.getWidth(context, 10),
                vertical: Layout.getHeight(context, 14),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Layout.getHeight(context, 30),
                ),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, //  positions arrow at end
                children: [
                  Row(
                    children: [
                      // Only show icon after user has made a selection
                      // Always use folder.png as the default icon
                      if (widget.isSelected) ...[
                        CircleAvatar(
                          backgroundColor: Color(0xFFF4F2FF),
                          maxRadius: 16,
                          child: Image.asset(
                            widget.icon,
                            width: 15,
                            height: 15,
                            color: Color(0xFF312684),
                          ),
                        ),
                        SizedBox(width: Layout.getWidth(context, 8)),
                      ],

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.label,
                            style: TextStyle(
                              color: widget.isSelected
                                  ? Colors.black
                                  : Color(0xFFB7B7B7),
                              fontSize: Layout.getHeight(context, 13),
                              fontWeight: widget.isSelected
                                  ? FontWeight.w500
                                  : FontWeight.normal,
                            ),
                          ),
                          if (widget.descrp.isNotEmpty)
                            Text(
                              widget.descrp,
                              style: TextStyle(
                                color: widget.isSelected
                                    ? Colors.black54
                                    : Colors.black26,
                                fontSize: widget.isSelected
                                    ? Layout.getHeight(context, 12)
                                    : Layout.getHeight(context, 10),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: Layout.getWidth(context, 8),
                    ),
                    child: Image.asset(
                      'assets/icons/ARC.png',
                      width: Layout.getWidth(context, 25),
                      height: Layout.getHeight(context, 25),
                    ),
                  ), //  stays at row end
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
