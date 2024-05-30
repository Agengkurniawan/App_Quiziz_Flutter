import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('KontakPage displays contact cards', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: KontakPage()));

    // Verify that contact cards are displayed.
    expect(find.byType(ContactCard), findsWidgets);

    // Example of additional assertions you might want to perform:
    // expect(find.text('Ageng Kurniawan'), findsOneWidget);
    // expect(find.text('Danar Adrian Ridho Nugroho'), findsOneWidget);
    // expect(find.text('Vitto Farin Kriswandi'), findsOneWidget);
  });
}
