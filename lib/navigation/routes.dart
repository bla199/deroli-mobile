import 'package:deroli_mobile/screens/Amount/AmountPage.dart';
import 'package:deroli_mobile/screens/Request-Money/request_money.dart';
import 'package:deroli_mobile/screens/home/activities.dart';
import 'package:deroli_mobile/screens/invoices/full_invoice_details.dart';
import 'package:deroli_mobile/screens/invoices/invoices.dart';
import 'package:deroli_mobile/screens/receipt/receipt.dart';
import 'package:deroli_mobile/screens/requested/full_request_details.dart';
import 'package:deroli_mobile/screens/requested/requested.dart';
import 'package:deroli_mobile/network/models/requests_modal.dart';
import 'package:deroli_mobile/screens/retire/full_retire_requested_details.dart';
import 'package:deroli_mobile/screens/retire/requested_transactions.dart';
import 'package:deroli_mobile/screens/retire/retired_transactions.dart';
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
      final extra = state.extra as Map<String, dynamic>?;
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
      final extra = state.extra as Map<String, dynamic>?;
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
    name: "retire",
    path: "/retire",
    builder: (context, state) => const Retire_Requested(),
  ),

  GoRoute(
    name: "retired_transactions",
    path: "/retired_transactions",
    builder: (context, state) => const RetiredTransactions(),
  ),
  GoRoute(
    name: "full_retire_request_details",
    path: "/full_retire_request_details",
    builder: (context, state) => const FullRetireRequestDetails(),
  ),

  GoRoute(
    name: "full_invoice_details",
    path: "/full_invoice_details",
    builder: (context, state) => const FullInvoiceDetails(),
  ),
];
