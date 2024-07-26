import 'package:equatable/equatable.dart';

class PaymentInformation extends Equatable{
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int currency;
  final int paymentFrequency;
  final double cost;
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
