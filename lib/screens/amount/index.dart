import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:deroli_mobile/components/general/back_arrow.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/services/moneyRequest.dart';
import 'package:flutter/material.dart';
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
                        const Color(0xFF312684),
                      ),
                    ),
                    onPressed: () {
                      // Get the amount from the text field
                      String amount = _controller.text.trim();
                      projectPayment();

                      // Pass all details to receipt page
                      context.push("/receipt");
                    },
                    child: const Text(
                      "Request Money",
                      style: TextStyle(fontSize: 12),
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
