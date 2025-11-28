import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:deroli_mobile/components/general/back_arrow.dart';
import 'package:deroli_mobile/components/general/modal.dart';
import 'package:deroli_mobile/components/general/toast.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/components/general/input_take.dart';
import 'package:deroli_mobile/screens/request-money/select_modal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

class RequestMoney extends StatefulWidget {
  const RequestMoney({super.key, required});

  @override
  State<RequestMoney> createState() => _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney> {
  @override
  Widget build(BuildContext context) {
    //
    final projectsController = Provider.of<ProjectsController>(context);
    return Scaffold(
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

      body: Column(
        children: [
          Consumer<ProjectsController>(
            builder: (context, projectsController, child) {
              return InputTake(
                title: "From - Project",
                label: projectsController.selectedPaymentProject.projectId == ''
                    ? "Select a project"
                    : "${projectsController.selectedPaymentProject.name} - ${projectsController.selectedPaymentProject.client?.name}",
                descrp:
                    projectsController.selectedPaymentProject.projectId == ''
                    ? ""
                    : "Project number - ****${projectsController.selectedPaymentProject.projectId.substring(projectsController.selectedPaymentProject.projectId.length - 6).toUpperCase()}",
                onTap: () {
                  bottomModal(
                    context: context,
                    child: SelectModal(type: 'project'),
                    blurColor: const Color.fromRGBO(212, 212, 212, 0.51),
                  );
                },
                isSelected:
                    projectsController.selectedPaymentProject.projectId != '',
              );
            },
          ),

          InputTake(
            title: "Vendor",
            label: projectsController.selectedVendor.vendorId == ''
                ? "Select vendor you want to pay"
                : projectsController.selectedVendor.name,
            onTap: () {
              context.push("/vendors");
            },
            isSelected: projectsController.selectedVendor.vendorId != '',
            descrp: projectsController.selectedVendor.vendorId == ''
                ? ""
                : "${projectsController.selectedVendor.paymentAccount?.provider.shortName} | ${projectsController.selectedVendor.paymentAccount?.accountNumber}",
          ),

          InputTake(
            title: "Category",
            label: projectsController.selectedPaymentCategory.categoryId == ''
                ? "Select category and sub-category"
                : projectsController.selectedPaymentCategory.name,
            descrp:
                projectsController.selectedPaymentSubProject.subProjectId == ''
                ? ""
                : projectsController.selectedPaymentSubProject.name,
            onTap: () {
              if (projectsController.selectedPaymentProject.projectId == '') {
                toastFunct(
                  context: context,
                  message: "Please select a project first",
                  isSuccess: false,
                );
                return;
              }
              context.push("/category");
            },
            isSelected:
                projectsController.selectedPaymentCategory.categoryId != '',
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(children: [Text("Payment Purpose")]),
                SizedBox(height: 8),
                GestureDetector(
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(8),
                    color: Colors.black26,
                    dashPattern: [4, 2],
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100.0,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/image.png',
                              width: 45,
                              height: 45,
                            ),
                            Text(
                              "Add an image of pdf file",
                              style: TextStyle(color: Color(0xFF6D6D6D)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      //
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
        child: FilledButton(
          onPressed: () {
            context.push("/amount");
          },
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xFF312684),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}
