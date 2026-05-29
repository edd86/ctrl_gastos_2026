import 'package:flutter_test/flutter_test.dart';
import 'package:ctrl_gastos/main.dart';

void main() {
  testWidgets('App renders placeholder text', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Controla tus gastos'), findsOneWidget);
  });
}
