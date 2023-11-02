import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu_resto/pages/login_page.dart';

void main() {
  testWidgets('UI Test for LoginPage', (WidgetTester tester) async {
    // Build our LoginPage widget.
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify that the "Log In" text is displayed.
    expect(find.text('Log In'), findsOneWidget);

    // Fill in the username and password fields.
    await tester.enterText(find.byType(TextFormField).at(0), 'your_username');
    await tester.enterText(find.byType(TextFormField).at(1), 'your_password');

    // Tap the "Log In" button.
    await tester.tap(find.text('Log In'));

    // Wait for the widgets to rebuild.
    await tester.pump();

    // Verify that the error text is displayed when providing invalid credentials.
    expect(find.text('Invalid username or password. Please try again.'),
        findsOneWidget);

    // You can add more test cases as needed.
  });
}
