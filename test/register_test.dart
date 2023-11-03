import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu_resto/pages/login_page.dart';
import 'package:menu_resto/pages/register_page.dart';

void main() {
  testWidgets('Register Page UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Register()));

    // Cek apakah widget text 'Register' ada di dalam tampilan
    expect(find.text('Register'), findsOneWidget);

    // Cek apakah semua TextFormField ada di dalam tampilan
    expect(find.byType(TextFormField), findsNWidgets(4));

    // Cek apakah ElevatedButton dengan teks 'Register' ada di dalam tampilan
    expect(find.widgetWithText(ElevatedButton, 'Register'), findsOneWidget);

    // Isi semua TextFormField dengan data uji
    await tester.enterText(find.byKey(Key('NamaField')), 'Putri Diana H');
    await tester.enterText(find.byKey(Key('EmailField')), 'putri@gmail.com');
    await tester.enterText(find.byKey(Key('UsernameField')), 'putri1');
    await tester.enterText(find.byKey(Key('PasswordField')), '123');

    // Tekan tombol Register
    await tester.tap(find.byType(ElevatedButton));

    // Rebuild widget setelah menekan tombol
    await tester.pump();

    // Cek apakah sudah beralih ke halaman Login setelah menekan tombol Register
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
