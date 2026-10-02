import 'package:flutter_test/flutter_test.dart';
import 'package:universidad_ti/main.dart';

void main() {
  testWidgets('Carga inicial de la Universidad TI', (
    WidgetTester tester,
  ) async {
    // Renderiza la aplicación
    await tester.pumpWidget(const MyApp());

    // Verifica que el título principal aparece en la AppBar
    expect(find.text('Universidad TI'), findsOneWidget);

    // Verifica que al menos una de las carreras esté en pantalla
    expect(find.text('Ingeniería en Desarrollo de Software'), findsOneWidget);
  });
}
