import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu_resto/pages/home_page.dart';
import 'package:menu_resto/pages/login_page.dart';

void main() {
  testWidgets('Login page UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify if the widgets are displayed correctly.
    expect(find.text('Log In'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text("Do you haven't account? "), findsOneWidget);
    expect(find.text('Register Now!'), findsOneWidget);

    // Enter valid username and password and tap the login button.
    await tester.enterText(find.byType(TextFormField).first, 'valid_username');
    await tester.enterText(find.byType(TextFormField).last, 'valid_password');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify if navigation to HomePage happens after successful login.
    expect(find.byType(LoginPage), findsNothing);
    expect(find.byType(HomePage), findsOneWidget);
  });
}
