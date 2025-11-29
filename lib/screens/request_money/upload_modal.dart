/*
  Modal to upload file
*/

/*
  Filter of expenses
*/

import 'dart:io';

import 'package:deroli_mobile/components/general/toast.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/network/index.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadModal extends StatefulWidget {
  const UploadModal({super.key});

  @override
  State<UploadModal> createState() => _UploadModalState();
}

class _UploadModalState extends State<UploadModal> {
  // get screen size
  late Size screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = Layout.getSize(context);
  }

  @override
  Widget build(BuildContext context) {
    final projectsController = Provider.of<ProjectsController>(context);
    return Container(
      width: screenSize.width * 0.87,
      margin: EdgeInsets.only(bottom: Layout.getWidth(context, 15)),
      //

      //
      child: Padding(
        //
        padding: EdgeInsets.symmetric(vertical: Layout.getHeight(context, 15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            // list of filters for transactions
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(8),
              ),

              // list of filters
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      checkPermission(Permission.photos, () async {
                        _pickAndUploadFile(
                          context,
                          projectsController,
                          allowMultiple: false,
                          type: FileType.image,
                        );
                        context.pop();
                      }, context);
                    },
                    child: uploadFilter(
                      // today transactions
                      hasDivider: true,
                      title: "Photo Library",
                      textColor: Colors.black,
                      context: context,
                    ),
                  ),

                  //
                  InkWell(
                    // call function to filter history
                    onTap: () {
                      checkPermission(Permission.photos, () async {
                        _pickAndUploadFile(
                          context,
                          projectsController,
                          allowMultiple: false,
                          type: FileType.image,
                        );
                      }, context);
                    },
                    child: uploadFilter(
                      // week transactions
                      hasDivider: true,
                      title: "Take Photo",
                      textColor: Colors.black,
                      context: context,
                    ),
                  ),

                  //
                  InkWell(
                    // call function to filter history
                    onTap: () {
                      checkPermission(Permission.photos, () async {}, context);
                    },
                    child: uploadFilter(
                      // month transactions
                      hasDivider: true,
                      title: "Choose File",
                      textColor: Colors.black,
                      context: context,
                    ),
                  ),
                ],
              ),
            ),

            // cancel pop
            Gap(Layout.getHeight(context, 15)),
            InkWell(
              onTap: () {
                context.pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: uploadFilter(
                  // specific transactions
                  hasDivider: false,
                  title: "Cancel",
                  textColor: Colors.black,
                  context: context,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// check user permission
Future<void> checkPermission(
  Permission permission,
  Function onGranted,
  BuildContext context,
) async {
  // final status = await permission.status;
  onGranted();

  // if (status.isGranted) {
  //   // Permission already granted
  //   onGranted();
  // } else if (status.isDenied || status.isRestricted) {
  //   // Request permission
  //   await permission.request().then((status) {
  //     debugPrint(status.isGranted.toString());
  //     if (status.isGranted) {
  //       onGranted();
  //     } else {
  //       // Show a message if permission is permanently denied
  //       if (status.isPermanentlyDenied) {
  //         // ignore: use_build_context_synchronously
  //         _showPermissionSettingsDialog(context);
  //       }
  //     }
  //   });
  // }
}

Widget uploadFilter({
  required String title,
  required bool hasDivider,
  required Color textColor,
  double textSize = 14,
  required BuildContext context,
}) {
  return Column(
    children: [
      Gap(Layout.getHeight(context, 12)),
      Text(
        title,
        style: Styles.normalText(
          context,
        ).copyWith(color: textColor, fontSize: textSize),
      ),
      Gap(Layout.getHeight(context, 12)),
      hasDivider
          ? Divider(
              height: Layout.getHeight(context, 1),
              color: const Color(0xFFDADADA),
            )
          : Container(),
    ],
  );
}

Future<void> _pickAndUploadFile(
  BuildContext context,
  ProjectsController projectsController, {
  required bool allowMultiple,
  required FileType type,
  List<String>? allowedExtensions,
}) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: type,
      allowMultiple: allowMultiple,
      allowedExtensions: allowedExtensions,
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      await _uploadInvoice(context, projectsController, file);
    }
  } catch (e) {
    debugPrint("Error picking file: $e");
    toastFunct(
      context: context,
      message: "Error selecting file",
      isSuccess: false,
    );
  }
}

Future<void> _uploadInvoice(
  BuildContext context,
  ProjectsController projectsController,
  File file,
) async {
  // Set uploading state
  projectsController.setIsUploadingInvoice(true);

  try {
    final response = await uploadFile(
      file: file,
      endpoint: ApiUrls.uploadInvoice,
      fieldName: 'invoice',
    );

    if (response['code'] == 200) {
      final invoiceUrl = response['response']['invoice_url'] as String? ?? '';
      projectsController.setInvoiceUrl(invoiceUrl);

      toastFunct(
        context: context,
        message:
            response['response']['message'] ?? 'Invoice uploaded successfully',
        isSuccess: true,
      );
    } else {
      toastFunct(
        context: context,
        message: response['response']['message'] ?? 'Failed to upload invoice',
        isSuccess: false,
      );
    }
  } catch (e) {
    debugPrint("Error uploading file: $e");
    toastFunct(
      context: context,
      message: "There was an issue uploading the file",
      isSuccess: false,
    );
  } finally {
    projectsController.setIsUploadingInvoice(false);
  }
}
