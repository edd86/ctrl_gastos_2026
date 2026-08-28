import 'package:ctrl_gastos/core/data/demo_data.dart';
import 'package:ctrl_gastos/features/home/presentation/widgets/amount_card.dart';
import 'package:ctrl_gastos/features/home/presentation/widgets/income_expense_card.dart';
import 'package:ctrl_gastos/features/home/presentation/widgets/recent_activity_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //Aquí se debe cargar la información desde la base de datos y mostrarla en la pantalla principal. Se debe mostrar el saldo actual, los gastos recientes y un botón para agregar un nuevo gasto.
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, size: 30),
          ),
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Hola'),
            Text(
              'Edward',
              style: TextStyle(fontSize: 27.8, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .05,
          vertical: size.height * .02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10, width: double.infinity),
            AmountCard(size: size, totalAmount: 500.00),
            const SizedBox(height: 10),
            IncomeExpenseCard(
              size: size,
              incomeAmount: 5000.00,
              expenseAmount: 500.00,
            ),
            const SizedBox(height: 20),
            RecentActivityWidget(transactions: demoTransactions),
          ],
        ),
      ),
    );
  }
}
