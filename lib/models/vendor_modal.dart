export 'vendor_modal.dart';

class Vendors {
  final String vendorId;
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
  final PaymentAccount? paymentAccount;

  // Convenience getters for easy access to payment account details
  String get account => paymentAccount?.provider?.name ?? '';
  String get accountNumber => paymentAccount?.accountNumber ?? '';

  Vendors({
    this.vendorId = '',
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
    this.paymentAccount,
  });

  Map<String, dynamic> toJson() {
    return {
      'vendor_id': vendorId,
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
      'payment_account': paymentAccount?.toJson(),
    };
  }

  factory Vendors.fromJson(Map<String, dynamic> json) {
    return Vendors(
      vendorId: json['vendor_id']?.toString() ?? '',
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
      paymentAccount: json['payment_account'] != null
          ? PaymentAccount.fromJson(json['payment_account'])
          : null,
    );
  }
}

class PaymentAccount {
  final String accountId;
  final String name;
  final String accountNumber;
  final String registered;
  final String organization;
  final Provider? provider;

  PaymentAccount({
    required this.accountId,
    required this.name,
    required this.accountNumber,
    required this.registered,
    required this.organization,
    this.provider,
  });

  Map<String, dynamic> toJson() {
    return {
      'account_id': accountId,
      'name': name,
      'account_number': accountNumber,
      'registered': registered,
      'organization': organization,
      'provider': provider?.toJson(),
    };
  }

  factory PaymentAccount.fromJson(Map<String, dynamic> json) {
    return PaymentAccount(
      accountId: json['account_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      accountNumber: json['account_number']?.toString() ?? '',
      registered: json['registered']?.toString() ?? '',
      organization: json['organization']?.toString() ?? '',
      provider: json['provider'] != null
          ? Provider.fromJson(json['provider'])
          : null,
    );
  }
}

class Provider {
  final String providerId;
  final String name;
  final String shortName;
  final String bic;
  final bool isTembo;
  final String serviceCode;
  final String providerType;
  final String registered;

  Provider({
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

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
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
