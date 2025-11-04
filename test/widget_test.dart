// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:soccerhaus_mobile/main.dart';

void main() {
  testWidgets('App renders SoccerHaus title and menu', (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const SoccerHausApp());

    // Cek AppBar title
    expect(find.text('SoccerHaus'), findsOneWidget);

    // Cek 3 tombol menu
    expect(find.text('All Products'), findsOneWidget);
    expect(find.text('My Products'), findsOneWidget);
    expect(find.text('Create Product'), findsOneWidget);
  });
}
