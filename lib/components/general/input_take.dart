import 'package:flutter/material.dart';
export 'input_take.dart';

class InputTake extends StatefulWidget {
  const InputTake({
    super.key,
    required this.title,
    required this.label,
    required this.icon,
  });

  final String title;
  final String label;
  final IconData icon;

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
          Text(widget.title, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 8),

          // Input Row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[200],
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, //  positions arrow at end
              children: [
                Row(
                  children: [
                    Icon(widget.icon, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(widget.label),
                  ],
                ),
                const Icon(Icons.arrow_drop_down), //  stays at row end
              ],
            ),
          ),
        ],
      ),
    );
  }
}
