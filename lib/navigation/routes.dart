import 'package:deroli_mobile/screens/Amount/AmountPage.dart';
import 'package:deroli_mobile/screens/Request-Money/request_money.dart';
import 'package:deroli_mobile/screens/home/activities.dart';
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
    name: "amount",
    path: "/amount",
    builder: (context, state) {
      final extra = state.extra as Map<String, String>?;
      return AmountPage(
        projectLabel: extra?['projectLabel'] ?? '',
        projectDescription: extra?['projectDescription'] ?? '',
        vendorLabel: extra?['vendorLabel'] ?? '',
        vendorDescription: extra?['vendorDescription'] ?? '',
        categoryLabel: extra?['categoryLabel'] ?? '',
        categoryDescription: extra?['categoryDescription'] ?? '',
      );
    },
  ),

  GoRoute(
    name: "receipt",
    path: "/receipt",
    builder: (context, state) {
      final extra = state.extra as Map<String, String>?;
      return Receipt(
        projectLabel: extra?['projectLabel'] ?? '',
        projectDescription: extra?['projectDescription'] ?? '',
        vendorLabel: extra?['vendorLabel'] ?? '',
        vendorDescription: extra?['vendorDescription'] ?? '',
        categoryLabel: extra?['categoryLabel'] ?? '',
        categoryDescription: extra?['categoryDescription'] ?? '',
        amount: extra?['amount'] ?? '0',
      );
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
