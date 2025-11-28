import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:deroli_mobile/components/general/back_arrow.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/services/money_request.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../components/main.dart';

class AmountPage extends StatefulWidget {
  const AmountPage({super.key});

  @override
  State<AmountPage> createState() => _AmountPageState();
}

class _AmountPageState extends State<AmountPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    final projectsController = Provider.of<ProjectsController>(context);
    return Scaffold(
      //
      backgroundColor: Color(0xFFF9F9F9),
      appBar: HeaderAppBar(
        title: "Request Money",
        isCentered: true,
        titleFontFamily: 'Trap',
        titleFontSize: 15,
        titleFontWeight: FontWeight.w700,
        backgroundColor: Color(0xFFF9F9F9),
        leading: BackArrow(context: context),
      ),

      //
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(_focusNode);
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // From / To Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      FromToFor(
                        title:
                            projectsController
                                .selectedPaymentProject
                                .projectId
                                .isNotEmpty
                            ? projectsController.selectedPaymentProject.name
                            : "Select a project",
                        directions: "From",
                        details:
                            projectsController
                                .selectedPaymentProject
                                .projectId
                                .isNotEmpty
                            ? "Project number - ****${projectsController.selectedPaymentProject.projectId.substring(projectsController.selectedPaymentProject.projectId.length - 6).toUpperCase()}"
                            : "Project Number",
                      ),
                      SizedBox(height: 10),
                      AppBorder(color: Color(0xFFEFEFEF)),
                      SizedBox(height: 10),
                      FromToFor(
                        title:
                            projectsController
                                .selectedVendor
                                .vendorId
                                .isNotEmpty
                            ? projectsController.selectedVendor.name
                            : "Select a vendor",
                        directions: "To",
                        details:
                            projectsController
                                .selectedVendor
                                .vendorId
                                .isNotEmpty
                            ? "${projectsController.selectedVendor.paymentAccount?.provider.shortName} | ${projectsController.selectedVendor.paymentAccount?.accountNumber}"
                            : "Vendor details",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // For Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: FromToFor(
                    title:
                        projectsController
                            .selectedPaymentCategory
                            .categoryId
                            .isNotEmpty
                        ? projectsController.selectedPaymentCategory.name
                        : "Select a category",
                    directions: "For",
                    details:
                        projectsController
                            .selectedPaymentCategory
                            .categoryId
                            .isNotEmpty
                        ? projectsController.selectedPaymentSubProject.name
                        : "Category details",
                  ),
                ),

                const SizedBox(height: 30),

                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text("Amount", style: TextStyle(fontSize: 12)),
                ),

                const SizedBox(height: 10),

                Center(
                  child: SizedBox(
                    width: 250,
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        _NumberInputFormatter(),
                      ],
                      onChanged: (value) {
                        // Remove commas and parse the numeric value
                        final numericValue = value.replaceAll(',', '');
                        if (numericValue.isNotEmpty) {
                          try {
                            final amount = double.parse(numericValue);
                            projectsController.setAmount(amount);
                          } catch (e) {
                            // Handle parse error
                            debugPrint('Error parsing amount: $e');
                          }
                        } else {
                          projectsController.setAmount(0.0);
                        }
                      },
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFA4A4A4),
                      ),
                      decoration: InputDecoration(
                        prefix: Transform.translate(
                          offset: const Offset(0, -15),
                          child: const Text(
                            "TZS",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFA4A4A4),
                            ),
                          ),
                        ),
                        hintText: '0',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black38,
                          fontSize: 40,
                        ),
                        isDense: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: FilledButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 18),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF312684).withOpacity(
                          projectsController.amount > 1000 ? 1 : 0.5,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      // Check if amount is valid
                      if (projectsController.amount > 1000) {
                        // Make API request to create payment
                        final success = await addProjectPayment(
                          context: context,
                          projectsController: projectsController,
                        );

                        // Navigate to receipt page on success
                        if (success) {
                          // ignore: use_build_context_synchronously
                          context.push("/receipt");
                        }
                      }
                    },
                    child: Text(
                      "Request Money",
                      style: TextStyle(
                        fontSize: Layout.getHeight(context, 12),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom formatter to add commas to numbers as user types
class _NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Extract only digits from the new value
    final newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // If empty, return empty
    if (newText.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Format with commas
    final formatted = _formatWithCommas(newText);

    // Calculate the cursor position
    final oldText = oldValue.text.replaceAll(RegExp(r'[^\d]'), '');
    final isAdding = newText.length > oldText.length;
    final isDeleting = newText.length < oldText.length;

    // Count digits before cursor in old formatted text
    int digitsBeforeCursor = 0;
    final oldCursorPos = oldValue.selection.baseOffset;
    for (int i = 0; i < oldCursorPos && i < oldValue.text.length; i++) {
      if (RegExp(r'\d').hasMatch(oldValue.text[i])) {
        digitsBeforeCursor++;
      }
    }

    // Adjust based on add/delete
    if (isAdding) {
      digitsBeforeCursor++;
    } else if (isDeleting && digitsBeforeCursor > 0) {
      digitsBeforeCursor--;
    }

    // Find the cursor position in the formatted string
    int cursorPosition = formatted.length;
    int digitCount = 0;
    for (int i = 0; i < formatted.length; i++) {
      if (formatted[i] != ',') {
        digitCount++;
        if (digitCount == digitsBeforeCursor) {
          cursorPosition = i + 1;
          break;
        }
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }

  String _formatWithCommas(String value) {
    if (value.isEmpty) return '';

    // Add commas every 3 digits from right to left
    final buffer = StringBuffer();
    for (int i = 0; i < value.length; i++) {
      if (i > 0 && (value.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(value[i]);
    }
    return buffer.toString();
  }
}
