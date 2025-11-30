import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:deroli_mobile/components/general/back_arrow.dart';
import 'package:deroli_mobile/components/general/modal.dart';
import 'package:deroli_mobile/components/general/toast.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/components/general/input_take.dart';
import 'package:deroli_mobile/screens/request_money/select_modal.dart';
import 'package:deroli_mobile/screens/request_money/upload_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';
import 'package:deroli_mobile/utils/index.dart';

class RequestMoney extends StatefulWidget {
  const RequestMoney({super.key});

  @override
  State<RequestMoney> createState() => _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney> {
  late Size screenSize;

  @override
  void didChangeDependencies() {
    screenSize = Layout.getSize(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //
    final projectsController = Provider.of<ProjectsController>(context);

    late bool isSelected =
        projectsController.selectedPaymentProject.projectId != '' &&
        projectsController.selectedVendor.vendorId != '' &&
        projectsController.selectedPaymentCategory.categoryId != '';
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
                icon: 'assets/icons/project.png',
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
            icon: 'assets/icons/Profile.png',
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
            icon: 'assets/icons/project.png',
          ),

          Consumer<ProjectsController>(
            builder: (context, projectsController, child) {
              final hasInvoice = projectsController.invoiceUrl.isNotEmpty;
              final isUploading = projectsController.isUploadingInvoice;

              return Padding(
                padding: EdgeInsets.all(Layout.getHeight(context, 30)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Payment Purpose",
                          style: Styles.normalText(
                            context,
                          ).copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: isUploading
                          ? null
                          : () => bottomModal(
                              child: UploadModal(),
                              context: context,
                              blurColor: const Color.fromRGBO(
                                189,
                                202,
                                247,
                                0.80,
                              ),
                            ),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(8),
                        color: Colors.black26,
                        dashPattern: [4, 2],
                        child: Container(
                          width: screenSize.width * 1,
                          height: screenSize.height * 0.12,
                          decoration: BoxDecoration(
                            color: hasInvoice
                                ? Color(0xFFF1F1F1)
                                : Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              // horizontal: 100.0,
                              vertical: screenSize.height * 0.018,
                            ),
                            child: Column(
                              children: [
                                if (isUploading)
                                  CupertinoActivityIndicator()
                                else if (hasInvoice)
                                  Image.asset(
                                    'assets/icons/invoice.png',
                                    width: 30,
                                    height: 30,
                                    color: Color(0xFF6D6D6D),
                                  )
                                else
                                  Image.asset(
                                    'assets/icons/image.png',
                                    width: 45,
                                    height: 45,
                                  ),
                                SizedBox(height: 8),
                                Text(
                                  hasInvoice
                                      ? "Invoice uploaded"
                                      : isUploading
                                      ? "Uploading..."
                                      : "Add an image or pdf file",
                                  style: TextStyle(
                                    color: hasInvoice
                                        ? Colors.green
                                        : Color(0xFF6D6D6D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),

      //
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Layout.getWidth(context, 20),
          vertical: Layout.getHeight(context, 40),
        ),
        child: FilledButton(
          onPressed: () {
            // check if project, vendor, category, and invoice are selected
            if (isSelected) {
              context.push("/amount");
            }
          },
          style: FilledButton.styleFrom(
            backgroundColor: Color(
              0xFF312684,
            ).withOpacity(isSelected ? 1 : 0.5),
            padding: EdgeInsets.symmetric(
              horizontal: Layout.getWidth(context, 16),
              vertical: Layout.getHeight(context, 12),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(Layout.getHeight(context, 4)),
            child: Text(
              "Next",
              style: Styles.normalText(
                context,
              ).copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
