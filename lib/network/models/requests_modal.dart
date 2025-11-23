import 'package:flutter/material.dart';
import 'package:deroli_mobile/network/models/vendor_modal.dart';
export 'requests_modal.dart';

class Payment {
  final String paymentId;
  final List<Transaction> transactions;
  final Vendors vendor;
  final PaymentUser user;
  final PaymentCategory category;
  final String? amount;
  final String? status;
  final String? registered;
  final String? organization;

  Payment({
    required this.paymentId,
    required this.transactions,
    required this.vendor,
    required this.user,
    required this.category,
    this.amount,
    this.status,
    this.registered,
    this.organization,
  });

  Map<String, dynamic> toJson() {
    return {
      'payment_id': paymentId,
      'transactions': transactions.map((t) => t.toJson()).toList(),
      'vendor': vendor.toJson(),
      'user': user.toJson(),
      'category': category.toJson(),
      'amount': amount,
      'status': status,
      'registered': registered,
      'organization': organization,
    };
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentId: json['payment_id']?.toString() ?? '',
      transactions: (json['transactions'] as List? ?? [])
          .map((t) => Transaction.fromJson(t))
          .toList(),
      vendor: Vendors.fromJson(json['vendor'] ?? {}),
      user: PaymentUser.fromJson(json['user'] ?? {}),
      category: PaymentCategory.fromJson(json['category'] ?? {}),
      amount: json['amount']?.toString(),
      status: json['status']?.toString(),
      registered: json['registered']?.toString(),
      organization: json['organization']?.toString(),
    );
  }

  // Helper methods
  Color getStatusColor() {
    switch ((status ?? '').toLowerCase()) {
      case 'pending':
        return Color(0xFFE3B644);
      case 'declined':
        return Color(0xFFE14345);
      case 'approved':
        return Color(0xFF4CAF50);
      default:
        return Color(0xFF9A9A9A);
    }
  }

  String getFormattedTime() {
    // First try the payment's registered field
    if (registered != null && registered!.isNotEmpty) {
      try {
        DateTime dateTime = DateTime.parse(registered!);
        return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
      } catch (e) {
        // If parsing fails, try to extract time from string format
        if (registered!.contains('T') && registered!.length > 16) {
          return registered!.substring(11, 16);
        }
      }
    }

    // Try to get time from vendor's payment account registered date
    if (vendor.paymentAccount?.registered != null &&
        vendor.paymentAccount!.registered.isNotEmpty) {
      try {
        DateTime dateTime = DateTime.parse(vendor.paymentAccount!.registered);
        return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
      } catch (e) {
        // Try string extraction
        String reg = vendor.paymentAccount!.registered;
        if (reg.contains('T') && reg.length > 16) {
          return reg.substring(11, 16);
        }
      }
    }

    // Return current time as fallback
    DateTime now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  String getFormattedDate() {
    if (registered == null || registered!.isEmpty) return 'Today';
    try {
      DateTime dateTime = DateTime.parse(registered!);
      DateTime now = DateTime.now();
      if (dateTime.year == now.year &&
          dateTime.month == now.month &&
          dateTime.day == now.day) {
        return 'Today';
      }
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } catch (e) {
      return registered!;
    }
  }

  String getFormattedDateTime() {
    if (registered == null || registered!.isEmpty) return 'Today, 17:28';
    try {
      DateTime dt = DateTime.parse(registered!);
      DateTime now = DateTime.now();
      String dateStr = 'Today';
      if (dt.year != now.year || dt.month != now.month || dt.day != now.day) {
        dateStr = '${dt.day}/${dt.month}/${dt.year}';
      }
      String timeStr =
          '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
      return '$dateStr, $timeStr';
    } catch (e) {
      return registered!;
    }
  }
}

class Transaction {
  final String transactionId;
  final String? amount;
  final String? status;
  final String? registered;

  Transaction({
    required this.transactionId,
    this.amount,
    this.status,
    this.registered,
  });

  Map<String, dynamic> toJson() {
    return {
      'transaction_id': transactionId,
      'amount': amount,
      'status': status,
      'registered': registered,
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId:
          json['transaction_id']?.toString() ?? json['id']?.toString() ?? '',
      amount: json['amount']?.toString(),
      status: json['status']?.toString(),
      registered: json['registered']?.toString(),
    );
  }
}

class PaymentUser {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final bool active;
  final String role;
  final String organization;

  PaymentUser({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.active,
    required this.role,
    required this.organization,
  });

  String get fullName => '$firstName $lastName';

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'active': active,
      'role': role,
      'organization': organization,
    };
  }

  factory PaymentUser.fromJson(Map<String, dynamic> json) {
    return PaymentUser(
      userId: json['user_id']?.toString() ?? '',
      firstName: json['first_name']?.toString() ?? '',
      lastName: json['last_name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      active: json['active'] ?? false,
      role: json['role']?.toString() ?? '',
      organization: json['organization']?.toString() ?? '',
    );
  }
}

class PaymentCategory {
  final String categoryId;
  final String? name;
  final String? allocatedBudget;
  final String? balanceBudget;
  final String? registered;
  final String? project;

  PaymentCategory({
    required this.categoryId,
    this.name,
    this.allocatedBudget,
    this.balanceBudget,
    this.registered,
    this.project,
  });

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'name': name,
      'allocated_budget': allocatedBudget,
      'balance_budget': balanceBudget,
      'registered': registered,
      'project': project,
    };
  }

  factory PaymentCategory.fromJson(Map<String, dynamic> json) {
    return PaymentCategory(
      categoryId: json['category_id']?.toString() ?? '',
      name: json['name']?.toString(),
      allocatedBudget: json['allocated_budget']?.toString(),
      balanceBudget: json['balance_budget']?.toString(),
      registered: json['registered']?.toString(),
      project: json['project']?.toString(),
    );
  }
}
