import 'package:flutter/material.dart';

enum TransactionType { transfer, deposit, cash, income, expense }

class TransactionEntity {
  final int? id;
  final int userId;
  final int accountId;
  final double amount;
  final String transactionDate;
  final TransactionType type;
  final String? description;
  final int? destinationId;

  TransactionEntity({
    this.id,
    required this.userId,
    required this.accountId,
    required this.amount,
    required this.transactionDate,
    required this.type,
    this.description,
    this.destinationId,
  });

  IconData get icon {
    switch (type) {
      case TransactionType.transfer:
        return Icons.compare_arrows;
      case TransactionType.deposit:
        return Icons.arrow_downward;
      case TransactionType.cash:
        return Icons.money;
      case TransactionType.income:
        return Icons.arrow_downward;
      case TransactionType.expense:
        return Icons.arrow_upward;
    }
  }
}
