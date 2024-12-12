import 'package:equatable/equatable.dart';
import 'package:mobile/src/features/dashboard/domain/domain.dart';

class PaymentInformation extends Equatable{
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PaymentCurrency currency;
  final PaymentFrequency paymentFrequency;
  final String cost;
  final bool negotiable;

  const PaymentInformation({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.currency,
    required this.paymentFrequency,
    required this.cost,
    required this.negotiable,
  });

  
  @override
  
  List<Object?> get props => [
    id,
    createdAt,
    updatedAt,
    currency,
    paymentFrequency,
    cost,
    negotiable,
  ];
}
