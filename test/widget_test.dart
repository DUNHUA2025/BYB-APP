import 'package:flutter_test/flutter_test.dart';
import 'package:bybanx_culture/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BybanxApp());
    expect(find.byType(BybanxApp), findsOneWidget);
  });
}
