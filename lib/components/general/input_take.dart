import 'package:flutter/material.dart';
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

  @override
  State<InputTake> createState() => _InputTakeState();
}

class _InputTakeState extends State<InputTake> {
  late String _currentLabel;
  late String _currentDescrp;

  @override
  void initState() {
    super.initState();
    _currentLabel = widget.label;
    _currentDescrp = widget.descrp;
  }

  /// Check if user has made a selection (label changed from initial)
  bool get _hasSelected =>
      _currentLabel != widget.label || _currentDescrp != widget.descrp;

  void _showOptionsModal() async {
    // If using hardcoded options, check if empty
    if (widget.fetchOptions == null && widget.options.isEmpty) {
      return;
    }

    // Initialize modal state
    bool isLoading = widget.fetchOptions != null;
    List<OptionItem> modalOptions = widget.fetchOptions == null
        ? widget.options
        : [];
    bool hasFetched = false;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext modalContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            // Load options when modal opens if fetchOptions is provided (only once)
            if (widget.fetchOptions != null && isLoading && !hasFetched) {
              hasFetched = true;
              widget.fetchOptions!()
                  .then((options) {
                    if (mounted) {
                      setModalState(() {
                        modalOptions = options;
                        isLoading = false;
                      });
                    }
                  })
                  .catchError((e) {
                    if (mounted) {
                      setModalState(() {
                        isLoading = false;
                      });
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //       'Failed to load options: ${e.toString()}',
                      //     ),
                      //     backgroundColor: Colors.red,
                      //   ),
                      // );
                    }
                  });
            }

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Handle bar
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Title
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Options list
                  if (isLoading)
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF312684),
                        ),
                      ),
                    )
                  else if (modalOptions.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Center(child: Text('No options available')),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: modalOptions.length,
                      itemBuilder: (context, index) {
                        final option = modalOptions[index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _currentLabel = option.label;
                              _currentDescrp = option.description;
                            });
                            // Call callback if provided
                            widget.onSelectionChanged?.call(
                              option.label,
                              option.description,
                            );
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        option.label,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      if (option.description.isNotEmpty) ...[
                                        SizedBox(height: 4),
                                        Text(
                                          option.description,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(widget.title, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 8),

          // Input Row
          InkWell(
            onTap: (widget.options.isNotEmpty || widget.fetchOptions != null)
                ? _showOptionsModal
                : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
                        const SizedBox(width: 8),
                      ],

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _currentLabel,
                            style: TextStyle(
                              color: _hasSelected
                                  ? Colors.black
                                  : Color(0xFFB7B7B7),
                              fontSize: 13,
                              fontWeight: _hasSelected
                                  ? FontWeight.w500
                                  : FontWeight.normal,
                            ),
                          ),
                          if (_currentDescrp.isNotEmpty)
                            Text(
                              _currentDescrp,
                              style: TextStyle(
                                color: _hasSelected
                                    ? Colors.black54
                                    : Colors.black26,
                                fontSize: _hasSelected ? 12 : 10,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      'assets/icons/ARC.png',
                      width: 25,
                      height: 25,
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
