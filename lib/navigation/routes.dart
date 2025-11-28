import 'package:deroli_mobile/screens/amount/index.dart';
import 'package:deroli_mobile/screens/request-money/category/index.dart';
import 'package:deroli_mobile/screens/request-money/vendors/index.dart';
import 'package:deroli_mobile/screens/request-money/index.dart';
import 'package:deroli_mobile/screens/home/index.dart';
import 'package:deroli_mobile/screens/invoices/invoices.dart';
import 'package:deroli_mobile/screens/receipt/receipt.dart';
import 'package:deroli_mobile/screens/requested/full_request_details.dart';
import 'package:deroli_mobile/screens/requested/requested.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> routes = [
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
    name: "full_request_details",
    path: "/full_request_details",
    builder: (context, state) => const FullRequestDetails(),
  ),
];
