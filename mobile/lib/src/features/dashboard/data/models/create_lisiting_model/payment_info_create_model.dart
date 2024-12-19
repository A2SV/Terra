class PaymentInformationCreateModel {
  final int currency;
  final int paymentFrequency;
  final double cost;
  final bool negotiable;

  const PaymentInformationCreateModel({
    required this.currency,
    required this.paymentFrequency,
    required this.cost,
    required this.negotiable,
  });

  PaymentInformationCreateModel copyWith({
    int? currency,
    int? paymentFrequency,
    double? cost,
    bool? negotiable,
  }) {
    return PaymentInformationCreateModel(
      currency: currency ?? this.currency,
      paymentFrequency: paymentFrequency ?? this.paymentFrequency,
      cost: cost ?? this.cost,
      negotiable: negotiable ?? this.negotiable,
    );
  }
}