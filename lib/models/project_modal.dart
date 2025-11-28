// Project model
class Project {
  final String projectId;
  final List<Payment> payments;
  final List<Category> categories;
  final List<ProjectTeam> projectTeam;
  final Client? client;
  final String name;
  final String registered;
  final String updated;
  final bool active;
  final String projectCode;
  final String projectBudget;
  final String projectAllocation;
  final String projectType;
  final String organization;
  final String user;

  Project({
    this.projectId = '',
    this.payments = const [],
    this.categories = const [],
    this.projectTeam = const [],
    this.client,
    this.name = '',
    this.registered = '',
    this.updated = '',
    this.active = true,
    this.projectCode = '',
    this.projectBudget = '',
    this.projectAllocation = '',
    this.projectType = '',
    this.organization = '',
    this.user = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'project_id': projectId,
      'payments': payments.map((p) => p.toJson()).toList(),
      'categories': categories.map((c) => c.toJson()).toList(),
      'project_team': projectTeam.map((pt) => pt.toJson()).toList(),
      'client': client?.toJson(),
      'name': name,
      'registered': registered,
      'updated': updated,
      'active': active,
      'project_code': projectCode,
      'project_budget': projectBudget,
      'project_allocation': projectAllocation,
      'project_type': projectType,
      'organization': organization,
      'user': user,
    };
  }

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      projectId: json['project_id']?.toString() ?? '',
      payments: (json['payments'] as List? ?? [])
          .map((p) => Payment.fromJson(p as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List? ?? [])
          .map((c) => Category.fromJson(c as Map<String, dynamic>))
          .toList(),
      projectTeam: (json['project_team'] as List? ?? [])
          .map((pt) => ProjectTeam.fromJson(pt as Map<String, dynamic>))
          .toList(),
      client: json['client'] != null
          ? Client.fromJson(json['client'] as Map<String, dynamic>)
          : null,
      name: json['name']?.toString() ?? '',
      registered: json['registered']?.toString() ?? '',
      updated: json['updated']?.toString() ?? '',
      active: json['active'] ?? false,
      projectCode: json['project_code']?.toString() ?? '',
      projectBudget: json['project_budget']?.toString() ?? '',
      projectAllocation: json['project_allocation']?.toString() ?? '',
      projectType: json['project_type']?.toString() ?? '',
      organization: json['organization']?.toString() ?? '',
      user: json['user']?.toString() ?? '',
    );
  }
}

// Payment model
class Payment {
  final String paymentId;
  final List<Transaction> transactions;
  final Vendor? vendor;
  final User? user;
  final Category category;
  final dynamic subProject; // Can be null or object
  final List<Task> tasks;
  final String amount;
  final String status;
  final String reference;
  final String paymentDate;
  final String paymentTime;
  final String paymentType;
  final String? paymentStatus;
  final String date;
  final String balanceBefore;
  final String balanceAfter;
  final String? invoice;
  final String? retireReceipt;
  final String project;

  Payment({
    required this.paymentId,
    required this.transactions,
    this.vendor,
    this.user,
    required this.category,
    this.subProject,
    required this.tasks,
    required this.amount,
    required this.status,
    required this.reference,
    required this.paymentDate,
    required this.paymentTime,
    required this.paymentType,
    this.paymentStatus,
    required this.date,
    required this.balanceBefore,
    required this.balanceAfter,
    this.invoice,
    this.retireReceipt,
    required this.project,
  });

  Map<String, dynamic> toJson() {
    return {
      'payment_id': paymentId,
      'transactions': transactions.map((t) => t.toJson()).toList(),
      'vendor': vendor?.toJson(),
      'user': user?.toJson(),
      'category': category.toJson(),
      'sub_project': subProject,
      'tasks': tasks.map((t) => t.toJson()).toList(),
      'amount': amount,
      'status': status,
      'reference': reference,
      'payment_date': paymentDate,
      'payment_time': paymentTime,
      'payment_type': paymentType,
      'payment_status': paymentStatus,
      'date': date,
      'balance_before': balanceBefore,
      'balance_after': balanceAfter,
      'invoice': invoice,
      'retire_receipt': retireReceipt,
      'project': project,
    };
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentId: json['payment_id']?.toString() ?? '',
      transactions: (json['transactions'] as List? ?? [])
          .map((t) => Transaction.fromJson(t as Map<String, dynamic>))
          .toList(),
      vendor: json['vendor'] != null
          ? Vendor.fromJson(json['vendor'] as Map<String, dynamic>)
          : null,
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      subProject: json['sub_project'],
      tasks: (json['tasks'] as List? ?? [])
          .map((t) => Task.fromJson(t as Map<String, dynamic>))
          .toList(),
      amount: json['amount']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
      reference: json['reference']?.toString() ?? '',
      paymentDate: json['payment_date']?.toString() ?? '',
      paymentTime: json['payment_time']?.toString() ?? '',
      paymentType: json['payment_type']?.toString() ?? '',
      paymentStatus: json['payment_status']?.toString(),
      date: json['date']?.toString() ?? '',
      balanceBefore: json['balance_before']?.toString() ?? '',
      balanceAfter: json['balance_after']?.toString() ?? '',
      invoice: json['invoice']?.toString(),
      retireReceipt: json['retire_receipt']?.toString(),
      project: json['project']?.toString() ?? '',
    );
  }
}

// Transaction model
class Transaction {
  final String transactionId;
  final PaymentProvider paymentProvider;
  final String countryCode;
  final String accountNo;
  final String serviceCode;
  final String msisdn;
  final double amount;
  final String narration;
  final String currencyCode;
  final String recipientNames;
  final String transactionRef;
  final String transactionDate;
  final String callbackUrl;
  final String registered;
  final String status;
  final String statusDescription;
  final TransactionMeta? meta;
  final String payment;

  Transaction({
    required this.transactionId,
    required this.paymentProvider,
    required this.countryCode,
    required this.accountNo,
    required this.serviceCode,
    required this.msisdn,
    required this.amount,
    required this.narration,
    required this.currencyCode,
    required this.recipientNames,
    required this.transactionRef,
    required this.transactionDate,
    required this.callbackUrl,
    required this.registered,
    required this.status,
    required this.statusDescription,
    this.meta,
    required this.payment,
  });

  Map<String, dynamic> toJson() {
    return {
      'transaction_id': transactionId,
      'paymentProvider': paymentProvider.toJson(),
      'country_code': countryCode,
      'account_no': accountNo,
      'service_code': serviceCode,
      'msisdn': msisdn,
      'amount': amount,
      'narration': narration,
      'currencyCode': currencyCode,
      'recipientNames': recipientNames,
      'transactionRef': transactionRef,
      'transactionDate': transactionDate,
      'callbackUrl': callbackUrl,
      'registered': registered,
      'status': status,
      'status_description': statusDescription,
      'meta': meta?.toJson(),
      'payment': payment,
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transaction_id']?.toString() ?? '',
      paymentProvider: PaymentProvider.fromJson(
        json['paymentProvider'] as Map<String, dynamic>,
      ),
      countryCode: json['country_code']?.toString() ?? '',
      accountNo: json['account_no']?.toString() ?? '',
      serviceCode: json['service_code']?.toString() ?? '',
      msisdn: json['msisdn']?.toString() ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      narration: json['narration']?.toString() ?? '',
      currencyCode: json['currencyCode']?.toString() ?? '',
      recipientNames: json['recipientNames']?.toString() ?? '',
      transactionRef: json['transactionRef']?.toString() ?? '',
      transactionDate: json['transactionDate']?.toString() ?? '',
      callbackUrl: json['callbackUrl']?.toString() ?? '',
      registered: json['registered']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
      statusDescription: json['status_description']?.toString() ?? '',
      meta: json['meta'] != null
          ? TransactionMeta.fromJson(json['meta'] as Map<String, dynamic>)
          : null,
      payment: json['payment']?.toString() ?? '',
    );
  }
}

// Payment Provider model
class PaymentProvider {
  final String providerId;
  final String name;
  final String shortName;
  final String bic;
  final bool isTembo;
  final String serviceCode;
  final String providerType;
  final String registered;

  PaymentProvider({
    required this.providerId,
    required this.name,
    required this.shortName,
    required this.bic,
    required this.isTembo,
    required this.serviceCode,
    required this.providerType,
    required this.registered,
  });

  Map<String, dynamic> toJson() {
    return {
      'provider_id': providerId,
      'name': name,
      'short_name': shortName,
      'bic': bic,
      'is_tembo': isTembo,
      'service_code': serviceCode,
      'provider_type': providerType,
      'registered': registered,
    };
  }

  factory PaymentProvider.fromJson(Map<String, dynamic> json) {
    return PaymentProvider(
      providerId: json['provider_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      shortName: json['short_name']?.toString() ?? '',
      bic: json['bic']?.toString() ?? '',
      isTembo: json['is_tembo'] ?? false,
      serviceCode: json['service_code']?.toString() ?? '',
      providerType: json['provider_type']?.toString() ?? '',
      registered: json['registered']?.toString() ?? '',
    );
  }
}

// Transaction Meta model
class TransactionMeta {
  final List<dynamic> data;
  final String? message;

  TransactionMeta({required this.data, this.message});

  Map<String, dynamic> toJson() {
    return {'data': data, 'message': message};
  }

  factory TransactionMeta.fromJson(Map<String, dynamic> json) {
    return TransactionMeta(
      data: json['data'] as List? ?? [],
      message: json['message']?.toString(),
    );
  }
}

// Vendor model (reusing from vendor_modal.dart structure)
class Vendor {
  final String vendorId;
  final PaymentAccount? paymentAccount;
  final String name;
  final String email;
  final String phone;
  final String region;
  final String street;
  final String address;
  final bool active;
  final String tinNumber;
  final String vrnNumber;
  final String vatNumber;
  final String organization;

  Vendor({
    this.vendorId = '',
    this.paymentAccount,
    this.name = '',
    this.email = '',
    this.phone = '',
    this.region = '',
    this.street = '',
    this.address = '',
    this.active = true,
    this.tinNumber = '',
    this.vrnNumber = '',
    this.vatNumber = '',
    this.organization = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'vendor_id': vendorId,
      'payment_account': paymentAccount?.toJson(),
      'name': name,
      'email': email,
      'phone': phone,
      'region': region,
      'street': street,
      'address': address,
      'active': active,
      'tin_number': tinNumber,
      'vrn_number': vrnNumber,
      'vat_number': vatNumber,
      'organization': organization,
    };
  }

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      vendorId: json['vendor_id']?.toString() ?? '',
      paymentAccount: json['payment_account'] != null
          ? PaymentAccount.fromJson(
              json['payment_account'] as Map<String, dynamic>,
            )
          : null,
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      region: json['region']?.toString() ?? '',
      street: json['street']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      active: json['active'] ?? false,
      tinNumber: json['tin_number']?.toString() ?? '',
      vrnNumber: json['vrn_number']?.toString() ?? '',
      vatNumber: json['vat_number']?.toString() ?? '',
      organization: json['organization']?.toString() ?? '',
    );
  }
}

// Payment Account model
class PaymentAccount {
  final String accountId;
  final PaymentProvider provider;
  final String name;
  final String accountNumber;
  final String registered;
  final String organization;

  PaymentAccount({
    required this.accountId,
    required this.provider,
    required this.name,
    required this.accountNumber,
    required this.registered,
    required this.organization,
  });

  Map<String, dynamic> toJson() {
    return {
      'account_id': accountId,
      'provider': provider.toJson(),
      'name': name,
      'account_number': accountNumber,
      'registered': registered,
      'organization': organization,
    };
  }

  factory PaymentAccount.fromJson(Map<String, dynamic> json) {
    return PaymentAccount(
      accountId: json['account_id']?.toString() ?? '',
      provider: PaymentProvider.fromJson(
        json['provider'] as Map<String, dynamic>,
      ),
      name: json['name']?.toString() ?? '',
      accountNumber: json['account_number']?.toString() ?? '',
      registered: json['registered']?.toString() ?? '',
      organization: json['organization']?.toString() ?? '',
    );
  }
}

// User model
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

// Category model
class Category {
  final String categoryId;
  final List<SubProject> subProjects;
  final String name;
  final String allocatedBudget;
  final String registered;
  final String balanceBudget;
  final String project;

  Category({
    this.categoryId = '',
    this.subProjects = const [],
    this.name = '',
    this.allocatedBudget = '',
    this.registered = '',
    this.balanceBudget = '',
    this.project = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'sub_projects': subProjects.map((sp) => sp.toJson()).toList(),
      'name': name,
      'allocated_budget': allocatedBudget,
      'registered': registered,
      'balance_budget': balanceBudget,
      'project': project,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id']?.toString() ?? '',
      subProjects: (json['sub_projects'] as List? ?? [])
          .map((sp) => SubProject.fromJson(sp as Map<String, dynamic>))
          .toList(),
      name: json['name']?.toString() ?? '',
      allocatedBudget: json['allocated_budget']?.toString() ?? '',
      registered: json['registered']?.toString() ?? '',
      balanceBudget: json['balance_budget']?.toString() ?? '',
      project: json['project']?.toString() ?? '',
    );
  }
}

// SubProject model
class SubProject {
  // Add sub-project fields when needed
  final String subProjectId;
  final String name;
  final String allocatedBudget;
  final String registered;
  final String balanceBudget;
  final String category;

  SubProject({
    this.subProjectId = '',
    this.name = '',
    this.allocatedBudget = '',
    this.registered = '',
    this.balanceBudget = '',
    this.category = '',
  });

  Map<String, dynamic> toJson() => {
    'sub_project_id': subProjectId,
    'name': name,
    'allocated_budget': allocatedBudget,
    'registered': registered,
    'balance_budget': balanceBudget,
    'category': category,
  };

  factory SubProject.fromJson(Map<String, dynamic> json) => SubProject(
    subProjectId: json['sub_project_id']?.toString() ?? '',
    name: json['name']?.toString() ?? '',
    allocatedBudget: json['allocated_budget']?.toString() ?? '',
    registered: json['registered']?.toString() ?? '',
    balanceBudget: json['balance_budget']?.toString() ?? '',
    category: json['category']?.toString() ?? '',
  );
}

// Task model
class Task {
  final String taskId;
  final User? users;
  final String status;
  final String registered;
  final String location;
  final String payment;

  Task({
    required this.taskId,
    this.users,
    required this.status,
    required this.registered,
    required this.location,
    required this.payment,
  });

  Map<String, dynamic> toJson() {
    return {
      'task_id': taskId,
      'users': users?.toJson(),
      'status': status,
      'registered': registered,
      'location': location,
      'payment': payment,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskId: json['task_id']?.toString() ?? '',
      users: json['users'] != null
          ? User.fromJson(json['users'] as Map<String, dynamic>)
          : null,
      status: json['status']?.toString() ?? '',
      registered: json['registered']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      payment: json['payment']?.toString() ?? '',
    );
  }
}

// ProjectTeam model
class ProjectTeam {
  final String projectTeamId;
  final String role;
  final String project;
  final String user;

  ProjectTeam({
    required this.projectTeamId,
    required this.role,
    required this.project,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      'project_team_id': projectTeamId,
      'role': role,
      'project': project,
      'user': user,
    };
  }

  factory ProjectTeam.fromJson(Map<String, dynamic> json) {
    return ProjectTeam(
      projectTeamId: json['project_team_id']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
      project: json['project']?.toString() ?? '',
      user: json['user']?.toString() ?? '',
    );
  }
}

// Client model
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
