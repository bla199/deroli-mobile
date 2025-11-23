class Invoice {
  final String invoiceId;
  final String invoiceNumber;
  final String invoiceDate;
  final String invoiceAmount;
  final String invoiceStatus;
  final String invoiceType;
  final String invoiceCategory;
  final String invoiceSubCategory;
  final String invoiceDescription;

  Invoice({
    required this.invoiceId,
    required this.invoiceNumber,
    required this.invoiceDate,
    required this.invoiceAmount,
    required this.invoiceStatus,
    required this.invoiceType,
    required this.invoiceCategory,
    required this.invoiceSubCategory,
    required this.invoiceDescription,
  });
  Map<String, dynamic> toJson() {
    return {
      'invoice_id': invoiceId,
      'invoice_number': invoiceNumber,
      'invoice_date': invoiceDate,
      'invoice_amount': invoiceAmount,
      'invoice_status': invoiceStatus,
      'invoice_type': invoiceType,
      'invoice_category': invoiceCategory,
      'invoice_sub_category': invoiceSubCategory,
      'invoice_description': invoiceDescription,
    };
  }

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      invoiceId: json['invoice_id']?.toString() ?? '',
      invoiceNumber: json['invoice_number']?.toString() ?? '',
      invoiceDate: json['invoice_date']?.toString() ?? '',
      invoiceAmount: json['invoice_amount']?.toString() ?? '',
      invoiceStatus: json['invoice_status']?.toString() ?? '',
      invoiceType: json['invoice_type']?.toString() ?? '',
      invoiceCategory: json['invoice_category']?.toString() ?? '',
      invoiceSubCategory: json['invoice_sub_category']?.toString() ?? '',
      invoiceDescription: json['invoice_description']?.toString() ?? '',
    );
  }
}
