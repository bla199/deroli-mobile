class InvoiceResponse {
  final List<Invoice> invoices;

  InvoiceResponse({required this.invoices});

  Map<String, dynamic> toJson() {
    return {'invoices': invoices.map((invoice) => invoice.toJson()).toList()};
  }

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) {
    return InvoiceResponse(
      invoices: (json['invoices'] as List? ?? [])
          .map((invoice) => Invoice.fromJson(invoice))
          .toList(),
    );
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
      unitPrice: (json['unit_price'] ?? 0.0).toDouble(),
      total: (json['total'] ?? 0.0).toDouble(),
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
