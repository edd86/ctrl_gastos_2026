import 'package:flutter/material.dart';

class IncomeExpenseCard extends StatelessWidget {
  final Size size;
  const IncomeExpenseCard({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          child: Container(
            height: size.height * .20,
            width: size.width * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.15),
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.750),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.45),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.arrow_downward,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Ingresos',
                    style: TextStyle(
                      fontSize: 18.85,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bs.',
                        style: TextStyle(
                          fontSize: 25.85,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '5000.00',
                        style: TextStyle(
                          fontSize: 25.85,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          child: Container(
            height: size.height * .20,
            width: size.width * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.15),
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.750),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Egresos',
                    style: TextStyle(
                      fontSize: 18.85,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bs.',
                        style: TextStyle(
                          fontSize: 25.85,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '500.00',
                        style: TextStyle(
                          fontSize: 25.85,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
