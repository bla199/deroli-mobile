import 'package:deroli_mobile/components/general/toast.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/models/project_modal.dart';
import 'package:deroli_mobile/network/index.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/material.dart';

void getVendors({
  required BuildContext context,
  required ProjectsController projectsController,
}) async {
  // loading
  projectsController.setGetVendorsLoading(true);

  //call API
  try {
    final apiRequest = await serverRequest(
      requestData: {
        "organization_id": "bb947d14-a06d-11f0-8de9-0242ac120002",
        "user_id": "039eba798dd24601abca5a3260d4a67e",
      },
      endpoint: ApiUrls.getVendors,
    );

    // check for response code and act according
    // 200 means success
    if (apiRequest['code'] == 200) {
      //map expenses and use from JSON to convert it to model
      List<Vendor> vendors = (apiRequest["response"]["vendors"] as List)
          .map((vendor) => Vendor.fromJson(vendor))
          .toList();

      // set vendors
      projectsController.setVendors(vendors);

      // loading
      projectsController.setGetVendorsLoading(false);
    } else {
      // ignore: use_build_context_synchronously
      toastFunct(
        // ignore: use_build_context_synchronously
        context: context,
        message: apiRequest['response']['message'],
        isSuccess: false,
      );

      // loading
      projectsController.setGetVendorsLoading(false);
    }
  } catch (e) {
    debugPrint("Error: $e");
    //todo: handle exception
    toastFunct(
      // ignore: use_build_context_synchronously
      context: context,
      message: "There was an issue while making request",
      isSuccess: false,
    );
    // loading
    projectsController.setGetVendorsLoading(false);
  }
}
