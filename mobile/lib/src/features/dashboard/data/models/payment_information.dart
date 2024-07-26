import 'package:mobile/src/features/dashboard/domain/domain.dart';

class PaymentInformationModel extends PaymentInformation {
  const PaymentInformationModel(
      {required super.id,
      required super.createdAt,
      required super.updatedAt,
      required super.currency,
      required super.paymentFrequency,
      required super.cost,
      required super.negotiable});

  factory PaymentInformationModel.fromJson(Map<String, dynamic> json) {
    return PaymentInformationModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      currency: json['currency'],
      paymentFrequency: json['paymentFrequency'],
      cost: json['cost'],
      negotiable: json['negotiable'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'currency': currency,
      'paymentFrequency': paymentFrequency,
      'cost': cost,
      'negotiable': negotiable,
    };
  }
}

