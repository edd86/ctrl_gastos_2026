import 'package:ctrl_gastos/features/transactions/domain/entities/transaction_entity.dart';
import 'package:flutter/material.dart';

class RecentActivityWidget extends StatelessWidget {
  final List<TransactionEntity> transactions;
  const RecentActivityWidget({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Actividad Reciente',
              style: TextStyle(fontSize: 20.85, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Ver todo',
                style: TextStyle(fontSize: 15.85, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        transactions.isEmpty
            ? Center(child: Text('No hay transacciones registradas.'))
            : SizedBox(
                height: 280,
                child: ListView.builder(
                  itemCount: transactions.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return ListTile(
                      title: transaction.description != null
                          ? Text(transaction.description!)
                          : Text('Sin descripción'),
                      trailing: transaction.type == TransactionType.income
                          ? Text(
                              '+\$${transaction.amount.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.green),
                            )
                          : Text(
                              '-\$${transaction.amount.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.red),
                            ),
                      leading: Icon(transaction.icon),
                      subtitle: Text(transaction.transactionDate),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
