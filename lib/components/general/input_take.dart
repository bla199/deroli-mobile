import 'package:flutter/material.dart';
export 'input_take.dart';

class InputTake extends StatefulWidget {
  const InputTake({
    super.key,
    required this.title,
    this.label = "",
    required this.icon,
    this.descrp = "",
    this.placeholder = "",
  });
  final String placeholder;
  final String descrp;
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
                    CircleAvatar(
                      child: Icon(
                        widget.icon,
                        color: Colors.deepPurpleAccent,
                        size: 15,
                      ),
                      backgroundColor: Color(0xFFF4F2FF),
                      maxRadius: 16,
                    ),
                    const SizedBox(width: 8),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.label,
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        Text(
                          widget.descrp,
                          style: TextStyle(color: Colors.black26, fontSize: 10),
                        ),
                      ],
                    ),
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
