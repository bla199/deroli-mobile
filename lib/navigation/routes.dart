import 'package:deroli_mobile/models/project_modal.dart';
import 'package:deroli_mobile/navigation/bottom_navigation.dart';
import 'package:deroli_mobile/screens/amount/index.dart';
import 'package:deroli_mobile/screens/invoices/full_invoice_details.dart';
import 'package:deroli_mobile/screens/request_money/vendors/index.dart';
import 'package:deroli_mobile/screens/request_money/index.dart';
import 'package:deroli_mobile/screens/home/index.dart';
import 'package:deroli_mobile/screens/invoices/invoices.dart';
import 'package:deroli_mobile/screens/receipt/receipt.dart';
import 'package:deroli_mobile/screens/request_money/category/index.dart';
import 'package:deroli_mobile/screens/requested/full_request_details.dart';
import 'package:deroli_mobile/screens/requested/index.dart';
import 'package:deroli_mobile/screens/retire/index.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> routes = [
  GoRoute(
    name: "bottom_navigation",
    path: "/bottom_navigation",
    builder: (context, state) => const BottomNavigation(),
  ),
  GoRoute(
    name: "activities",
    path: "/activities",
    builder: (context, state) => const Activities(),
  ),

  GoRoute(
    name: "request_money",
    path: "/request_money",
    builder: (context, state) => const RequestMoney(),
  ),

  GoRoute(
    name: "vendors",
    path: "/vendors",
    builder: (context, state) => const VendorsPage(),
  ),

  GoRoute(
    name: "category",
    path: "/category",
    builder: (context, state) => const CategoryPage(),
  ),

  GoRoute(
    name: "amount",
    path: "/amount",
    builder: (context, state) {
      return AmountPage();
    },
  ),

  GoRoute(
    name: "receipt",
    path: "/receipt",
    builder: (context, state) {
      return Receipt();
    },
  ),

  GoRoute(
    name: "requested",
    path: "/requested",
    builder: (context, state) => const Requested(),
  ),

  GoRoute(
    name: "invoice",
    path: "/invoice",
    builder: (context, state) => const Invoices(),
  ),
  GoRoute(
    name: "retire",
    path: "/retire",
    builder: (context, state) => const Retire(),
  ),

  GoRoute(
    name: "full_invoice_details",
    path: "/full_invoice_details",
    builder: (context, state) => const FullInvoiceDetails(),
  ),

  GoRoute(
    name: "full_request_details",
    path: "/full_request_details",
    builder: (context, state) {
      final payment = state.extra as Payment;
      return FullRequestDetailsScreen(payment: payment);
    },
  ),
];
