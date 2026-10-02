import 'package:ctrl_gastos/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AmountCard extends StatelessWidget {
  final Size size;
  final double totalAmount;
  const AmountCard({required this.size, required this.totalAmount, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: size.height * .20,
        width: size.width * .8,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Saldo Actual',
                style: TextStyle(fontSize: 18.85, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bs.',
                    style: TextStyle(
                      fontSize: 45.85,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$totalAmount',
                    style: TextStyle(
                      fontSize: 45.85,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                width: size.width * .7,
                child: ElevatedButton.icon(
                  label: Text('Agregar', style: TextStyle(fontSize: 19.25)),
                  icon: Icon(Icons.add, size: 25),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.green[900],
                  ),
                  onPressed: () {
                    showDialogMessage(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDialogMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ingrese la cantidad de Monto a Agregar'),
        content: CustomTextField(
          labelText: 'Monto',
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              // Aquí puedes agregar la lógica para manejar el monto ingresado
              Navigator.of(context).pop();
            },
            child: Text('Agregar'),
          ),
        ],
      ),
    );
  }
}
