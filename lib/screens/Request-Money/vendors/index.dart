import 'package:deroli_mobile/components/general/app_bar.dart';
import 'package:deroli_mobile/components/general/back_arrow.dart';
import 'package:deroli_mobile/components/general/dashed_border.dart';
import 'package:deroli_mobile/controller/index.dart';
import 'package:deroli_mobile/models/project_modal.dart';
import 'package:deroli_mobile/services/get_vendors.dart';
import 'package:deroli_mobile/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class VendorsPage extends StatefulWidget {
  const VendorsPage({super.key});

  @override
  State<VendorsPage> createState() => _VendorsPageState();
}

class _VendorsPageState extends State<VendorsPage> {
  @override
  void initState() {
    // debt manager
    final projectsController = Provider.of<ProjectsController>(
      context,
      listen: false,
    );

    // pull debt transactions
    getVendors(context: context, projectsController: projectsController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      backgroundColor: Color(0xFFF9F9F9),
      appBar: HeaderAppBar(
        title: "Vendors",
        isCentered: true,
        titleFontFamily: 'Trap',
        titleFontSize: 16,
        titleFontWeight: FontWeight.w600,
        backgroundColor: Color(0xFFF9F9F9),
        leading: BackArrow(context: context),
      ),

      //
      body: Consumer<ProjectsController>(
        builder: (context, projectsController, child) {
          // Get vendors from controller
          final vendors = projectsController.getVendors;

          // Group vendors by first letter of name
          Map<String, List<Vendor>> groupedVendors = {};
          for (var vendor in vendors) {
            if (vendor.name.isNotEmpty) {
              final firstLetter = vendor.name[0].toUpperCase();
              if (!groupedVendors.containsKey(firstLetter)) {
                groupedVendors[firstLetter] = [];
              }
              groupedVendors[firstLetter]!.add(vendor);
            }
          }

          // Sort vendors within each group by name
          groupedVendors.forEach((key, value) {
            value.sort((a, b) => a.name.compareTo(b.name));
          });

          // Sort the keys (letters) alphabetically
          final sortedLetters = groupedVendors.keys.toList()..sort();

          return ListView(
            children: [
              // gap
              Gap(Layout.getHeight(context, 15)),

              // add vendor button
              Container(
                //
                padding: EdgeInsets.symmetric(
                  horizontal: Layout.getWidth(context, 15),
                  vertical: Layout.getHeight(context, 12),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: Layout.getWidth(context, 15),
                ),

                //
                decoration: BoxDecoration(
                  color: Color(0xFFF0F0F0).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(
                    Layout.getHeight(context, 6),
                  ),
                  border: Border.all(
                    color: Color(0xFFC1C1C1),
                    width: Layout.getHeight(context, 0.5),
                  ),
                ),
                child: Row(
                  children: [
                    // image
                    Image.asset(
                      'assets/icons/vendors.png',
                      width: Layout.getHeight(context, 25),
                      height: Layout.getHeight(context, 25),
                    ),

                    // text
                    Gap(Layout.getHeight(context, 10)),
                    Text(
                      'Add a new vendor',
                      style: TextStyle(
                        fontSize: Layout.getHeight(context, 13),
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF9A9A9A),
                      ),
                    ),

                    //
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      size: Layout.getHeight(context, 20),
                      color: Color(0xFF130F26),
                    ),
                  ],
                ),
              ),

              // vendors list
              Gap(Layout.getHeight(context, 30)),

              // Display vendors grouped by alphabet
              ...sortedLetters.map((letter) {
                final letterVendors = groupedVendors[letter]!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Letter header
                    Padding(
                      padding: EdgeInsets.only(
                        left: Layout.getWidth(context, 15),
                      ),
                      child: Text(
                        letter,
                        style: TextStyle(
                          fontSize: Layout.getHeight(context, 14),
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF9A9A9A),
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xFFEEEEEE),
                      thickness: Layout.getHeight(context, 1),
                    ),

                    // Vendors for this letter
                    ...letterVendors.map((vendor) {
                      return Column(
                        children: [
                          Gap(Layout.getHeight(context, 15)),
                          InkWell(
                            onTap: () {
                              projectsController.setSelectedVendor(vendor);
                              context.pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Layout.getWidth(context, 30),
                                right: Layout.getWidth(context, 15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // name
                                  Text(
                                    vendor.name,
                                    style: TextStyle(
                                      fontSize: Layout.getHeight(context, 13),
                                    ),
                                  ),
                                  Gap(Layout.getHeight(context, 12)),

                                  Row(
                                    children: [
                                      if (vendor.paymentAccount?.provider !=
                                          null)
                                        Text(
                                          vendor
                                              .paymentAccount!
                                              .provider
                                              .shortName
                                              .toUpperCase(),
                                          style: TextStyle(
                                            fontSize: Layout.getHeight(
                                              context,
                                              12,
                                            ),
                                            color: Color(0xFFA0A0A0),
                                          ),
                                        ),
                                      if (vendor.paymentAccount?.provider !=
                                              null &&
                                          vendor
                                                  .paymentAccount
                                                  ?.accountNumber !=
                                              null)
                                        Gap(Layout.getHeight(context, 5)),
                                      if (vendor
                                              .paymentAccount
                                              ?.accountNumber !=
                                          null)
                                        Text(
                                          vendor.paymentAccount!.accountNumber,
                                          style: TextStyle(
                                            fontSize: Layout.getHeight(
                                              context,
                                              12,
                                            ),
                                          ),
                                        ),

                                      const Spacer(),
                                      if (vendor.email.isNotEmpty)
                                        Text(
                                          vendor.email,
                                          style: TextStyle(
                                            fontSize: Layout.getHeight(
                                              context,
                                              12,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),

                                  Gap(Layout.getHeight(context, 5)),
                                  DashedBorder(
                                    color: Color(0xFF000000),
                                    dashPattern: [4, 5],
                                    strokeWidth: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
