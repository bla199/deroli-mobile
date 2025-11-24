class InvoiceResponse {
  final List<Invoice> invoices;

  InvoiceResponse({required this.invoices});

  Map<String, dynamic> toJson() {
    return {'invoices': invoices.map((invoice) => invoice.toJson()).toList()};
  }

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) {
    try {
      final invoicesList = json['invoices'];
      if (invoicesList == null) {
        print("WARNING: 'invoices' key is null in response");
        return InvoiceResponse(invoices: []);
      }

      if (invoicesList is! List) {
        print(
          "WARNING: 'invoices' is not a List, it's ${invoicesList.runtimeType}",
        );
        return InvoiceResponse(invoices: []);
      }

      final invoices = invoicesList
          .map<Invoice?>((invoice) {
            try {
              return Invoice.fromJson(invoice as Map<String, dynamic>);
            } catch (e) {
              print("Error parsing invoice: $e");
              print("Invoice data: $invoice");
              return null;
            }
          })
          .whereType<Invoice>()
          .toList();

      print("Successfully parsed ${invoices.length} invoices");
      return InvoiceResponse(invoices: invoices);
    } catch (e, stackTrace) {
      print("Error in InvoiceResponse.fromJson: $e");
      print("Stack trace: $stackTrace");
      return InvoiceResponse(invoices: []);
    }
  }
}

class Invoice {
  final String invoiceId;
  final List<InvoiceItem> items;
  final Client client;
  final User user;
  final String invoiceNumber;
  final String issueDate;
  final String dueDate;

  Invoice({
    required this.invoiceId,
    required this.items,
    required this.client,
    required this.user,
    required this.invoiceNumber,
    required this.issueDate,
    required this.dueDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'invoice_id': invoiceId,
      'items': items.map((item) => item.toJson()).toList(),
      'client': client.toJson(),
      'user': user.toJson(),
      'invoice_number': invoiceNumber,
      'issue_date': issueDate,
      'due_date': dueDate,
    };
  }

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      invoiceId: json['invoice_id']?.toString() ?? '',
      items: (json['items'] as List? ?? [])
          .map((item) => InvoiceItem.fromJson(item))
          .toList(),
      client: Client.fromJson(json['client'] ?? {}),
      user: User.fromJson(json['user'] ?? {}),
      invoiceNumber: json['invoice_number']?.toString() ?? '',
      issueDate: json['issue_date']?.toString() ?? '',
      dueDate: json['due_date']?.toString() ?? '',
    );
  }

  // Helper methods
  double getTotalAmount() {
    return items.fold(0.0, (sum, item) => sum + item.total);
  }

  String getFormattedIssueDate() {
    if (issueDate.isEmpty) return 'Today';
    try {
      DateTime dateTime = DateTime.parse(issueDate);
      DateTime now = DateTime.now();
      if (dateTime.year == now.year &&
          dateTime.month == now.month &&
          dateTime.day == now.day) {
        return 'Today';
      }
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } catch (e) {
      return issueDate;
    }
  }

  String getFormattedDueDate() {
    if (dueDate.isEmpty) return 'N/A';
    try {
      DateTime dateTime = DateTime.parse(dueDate);
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } catch (e) {
      return dueDate;
    }
  }
}

class InvoiceItem {
  final String itemId;
  final String name;
  final int quantity;
  final double unitPrice;
  final double total;
  final String invoice;

  InvoiceItem({
    required this.itemId,
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.total,
    required this.invoice,
  });

  Map<String, dynamic> toJson() {
    return {
      'item_id': itemId,
      'name': name,
      'quantity': quantity,
      'unit_price': unitPrice,
      'total': total,
      'invoice': invoice,
    };
  }

  factory InvoiceItem.fromJson(Map<String, dynamic> json) {
    return InvoiceItem(
      itemId: json['item_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      quantity: json['quantity'] ?? 0,
      unitPrice: double.parse(json['unit_price'].toString()),

      total: double.parse(json['total'].toString()),

      invoice: json['invoice']?.toString() ?? '',
    );
  }
}

class Client {
  final String clientId;
  final String name;
  final String email;
  final bool active;
  final String registered;
  final String organization;

  Client({
    required this.clientId,
    required this.name,
    required this.email,
    required this.active,
    required this.registered,
    required this.organization,
  });

  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'name': name,
      'email': email,
      'active': active,
      'registered': registered,
      'organization': organization,
    };
  }

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      clientId: json['client_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      active: json['active'] ?? false,
      registered: json['registered']?.toString() ?? '',
      organization: json['organization']?.toString() ?? '',
    );
  }
}

class User {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final bool active;
  final String role;
  final String organization;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.active,
    required this.role,
    required this.organization,
  });

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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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
