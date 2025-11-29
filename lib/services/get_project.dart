import 'package:deroli_mobile/components/general/toast.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/models/project_modal.dart';
import 'package:deroli_mobile/network/index.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/material.dart';

void getProjects({
  required BuildContext context,
  required ProjectsController projectsController,
}) async {
  // loading
  projectsController.setGetProjectsLoading(true);

  //call API
  try {
    final apiRequest = await serverRequest(
      requestData: {
        "organization_id": "bb947d14-a06d-11f0-8de9-0242ac120002",
        "user_id": "039eba798dd24601abca5a3260d4a67e",
      },
      endpoint: ApiUrls.getProjects,
    );

    // check for response code and act according
    // 200 means success
    if (apiRequest['code'] == 200) {
      //map expenses and use from JSON to convert it to model
      List<Project> projects = (apiRequest["response"]["projects"] as List)
          .map((project) => Project.fromJson(project))
          .toList();

      // set projects
      projectsController.setProjects(projects);

      // loading
      projectsController.setGetProjectsLoading(false);
    } else {
      // ignore: use_build_context_synchronously
      toastFunct(
        // ignore: use_build_context_synchronously
        context: context,
        message: apiRequest['response']['message'],
        isSuccess: false,
      );

      // loading
      projectsController.setGetProjectsLoading(false);
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
    projectsController.setGetProjectsLoading(false);
  }
}

// get requested payments
void getRequestedPayments({
  required BuildContext context,
  required ProjectsController projectsController,
}) async {
  // loading
  projectsController.setGetRequestedPaymentsLoading(true);

  // call API
  try {
    final apiRequest = await serverRequest(
      requestData: {
        "organization_id": "bb947d14-a06d-11f0-8de9-0242ac120002",
        "user_id": "039eba798dd24601abca5a3260d4a67e",
      },
      endpoint: ApiUrls.getRequested,
    );
    // check for response code and act according
    // 200 means success
    if (apiRequest['code'] == 200) {
      //map expenses and use from JSON to convert it to model
      List<Payment> payments = (apiRequest["response"]["payments"] as List)
          .map((payment) => Payment.fromJson(payment))
          .toList();

      // set requested payments
      projectsController.setRequestedPayments(payments);

      // loading
      projectsController.setGetRequestedPaymentsLoading(false);
    } else {
      // ignore: use_build_context_synchronously
      toastFunct(
        // ignore: use_build_context_synchronously
        context: context,
        message: apiRequest['response']['message'],
        isSuccess: false,
      );

      // loading
      projectsController.setGetRequestedPaymentsLoading(false);
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
    projectsController.setGetRequestedPaymentsLoading(false);
  }
}
