import 'package:flutter/material.dart';
import 'package:deroli_mobile/utils/index.dart';
export 'input_take.dart';

class OptionItem {
  final String label;
  final String description;

  OptionItem({required this.label, required this.description});
}

class InputTake extends StatefulWidget {
  const InputTake({
    super.key,
    required this.title,
    this.label = "",
    this.icon,
    this.iconAsset,
    this.descrp = "",
    this.placeholder = "",
    this.options = const [],
    this.fetchOptions,
    this.onSelectionChanged,
    this.onTap,
  });
  final String placeholder;
  final String descrp;
  final String title;
  final String label;
  final IconData? icon;
  final String? iconAsset;
  final List<OptionItem> options;
  final Future<List<OptionItem>> Function()? fetchOptions;
  final void Function(String label, String description)? onSelectionChanged;
  final VoidCallback? onTap;

  @override
  State<InputTake> createState() => _InputTakeState();
}

class _InputTakeState extends State<InputTake> {
  @override
  void didUpdateWidget(InputTake oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update state when widget properties change
  }

  /// Check if user has made a selection (label changed from initial)
  /// Selection is made when description is provided or label doesn't start with "Select"
  bool get _hasSelected =>
      widget.descrp.isNotEmpty ||
      (widget.label.isNotEmpty &&
          !widget.label.toLowerCase().startsWith('select'));

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
            onTap: widget.onTap ?? () {},
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
                      if (_hasSelected) ...[
                        CircleAvatar(
                          backgroundColor: Color(0xFFF4F2FF),
                          maxRadius: 16,
                          child: Image.asset(
                            'assets/icons/project.png',
                            width: 15,
                            height: 15,
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
                              color: _hasSelected
                                  ? Colors.black
                                  : Color(0xFFB7B7B7),
                              fontSize: Layout.getHeight(context, 13),
                              fontWeight: _hasSelected
                                  ? FontWeight.w500
                                  : FontWeight.normal,
                            ),
                          ),
                          if (widget.descrp.isNotEmpty)
                            Text(
                              widget.descrp,
                              style: TextStyle(
                                color: _hasSelected
                                    ? Colors.black54
                                    : Colors.black26,
                                fontSize: _hasSelected
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
