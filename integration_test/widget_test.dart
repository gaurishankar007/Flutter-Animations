import 'package:flutter_animations/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('Implicit Animations'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    expect(find.text('Implicit Animations'), findsOneWidget);
  });
}
