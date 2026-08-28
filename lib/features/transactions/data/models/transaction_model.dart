import 'package:ctrl_gastos/features/transactions/domain/entities/transaction_entity.dart';

class TransactionModel {
  final int? id;
  final int userId;
  final int accountId;
  final double amount;
  final String transactionDate;
  final TransactionType type;
  final String? description;
  final int? destinationId;

  TransactionModel({
    this.id,
    required this.userId,
    required this.accountId,
    required this.amount,
    required this.transactionDate,
    required this.type,
    this.description,
    this.destinationId,
  });

  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
      id: entity.id,
      userId: entity.userId,
      accountId: entity.accountId,
      amount: entity.amount,
      transactionDate: entity.transactionDate,
      type: entity.type,
      description: entity.description,
      destinationId: entity.destinationId,
    );
  }

  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      userId: userId,
      accountId: accountId,
      amount: amount,
      transactionDate: transactionDate,
      type: type,
      description: description,
      destinationId: destinationId,
    );
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      userId: map['user_id'],
      accountId: map['account_id'],
      amount: map['amount'],
      transactionDate: map['transaction_date'],
      type: TransactionType.values.firstWhere(
        (e) => e.toString() == 'TransactionType.${map['type']}',
      ),
      description: map['description'],
      destinationId: map['destination_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'account_id': accountId,
      'amount': amount,
      'transaction_date': transactionDate,
      'type': type.toString().split('.').last,
      'description': description,
      'destination_id': destinationId,
    };
  }
}
