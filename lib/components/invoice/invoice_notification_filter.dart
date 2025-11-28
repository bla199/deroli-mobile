import 'package:flutter/material.dart';

export 'invoice_notification_filter.dart';

class InvoiceFilter extends StatefulWidget {
  const InvoiceFilter({Key? key}) : super(key: key);

  @override
  State<InvoiceFilter> createState() => _InvoiceFilterState();
}

class _InvoiceFilterState extends State<InvoiceFilter> {
  int selectedIndex = 0;
  final List<String> filters = ['All', 'Paid', 'Unpaid'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Color(0xFFECECEC)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(filters.length, (index) {
          bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() => selectedIndex = index);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFECECEC)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                filters[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.black : const Color(0xFF979797),
                  fontSize: 15,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
