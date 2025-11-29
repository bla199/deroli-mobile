import 'package:deroli_mobile/components/general/modal.dart';
import 'package:deroli_mobile/components/general/toast.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/network/index.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
export 'get_vendors.dart';

Future<bool> addProjectPayment({
  required BuildContext context,
  required ProjectsController projectsController,
}) async {
  try {
    // display a loading modal while sending a request
    bottomModal(
      child: loadingModal(context),
      context: context,
      blurColor: const Color.fromRGBO(173, 191, 255, 0.7),
      isDismissible: false,
      isScrollControlled: false,
      enableDrag: false,
    );

    final project = projectsController.selectedPaymentProject;
    final category = projectsController.selectedPaymentCategory;
    final subCategory = projectsController.selectedPaymentSubProject;
    final vendor = projectsController.selectedVendor;
    final amount = projectsController.amount;
    final invoiceUrl = projectsController.invoiceUrl;

    // Build the payload
    final requestData = {
      "amount": amount,
      "project_id": project.projectId,
      "category": category.toJson(),
      "sub_category": {
        "sub_project_id": subCategory.subProjectId,
        "name": subCategory.name,
        "allocated_budget": subCategory.allocatedBudget,
        "registered": subCategory.registered,
        "balance_budget": subCategory.balanceBudget,
        "project": project.projectId,
        "category_id": category.categoryId,
      },
      "vendor": vendor.toJson(),
      "invoice": invoiceUrl,
      "user_id": "039eba798dd24601abca5a3260d4a67e",
      "organization_id": "bb947d14-a06d-11f0-8de9-0242ac120002",
    };

    // Make API request
    final apiRequest = await serverRequest(
      requestData: requestData,
      endpoint: ApiUrls.addProjectPayment,
    );

    // dismiss the loading modal
    // ignore: use_build_context_synchronously
    context.pop();

    // Check response
    if (apiRequest['code'] == 200 || apiRequest['code'] == 201) {
      toastFunct(
        // ignore: use_build_context_synchronously
        context: context,
        message:
            apiRequest['response']['message'] ??
            'Payment request created successfully',
        isSuccess: true,
      );

      return true;
    } else {
      toastFunct(
        // ignore: use_build_context_synchronously
        context: context,
        message:
            apiRequest['response']['message'] ??
            'Failed to create payment request',
        isSuccess: false,
      );
      return false;
    }
  } catch (e) {
    debugPrint("Error creating payment request: $e");
    toastFunct(
      // ignore: use_build_context_synchronously
      context: context,
      message: "There was an issue creating the payment request",
      isSuccess: false,
    );
    return false;
  }
}
