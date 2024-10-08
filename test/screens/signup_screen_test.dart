import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musicapp_final/screens/register_screen.dart';

void main() {
  group('RegisterScreen Tests', () {
    testWidgets('All text fields and button are present', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: RegisterScreen()),
      );

      // Check for all text fields
      expect(find.byType(TextFormField), findsNWidgets(4));
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);

      expect(find.text('Register'), findsOneWidget);
    });

    testWidgets('Form validation works as expected', (WidgetTester tester) async {
  // Set larger screen size
  // ignore: deprecated_member_use
  tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
  // ignore: deprecated_member_use
  addTearDown(() => tester.binding.window.clearPhysicalSizeTestValue());

  await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));

  // Ensure "Register" button is visible and tap it
  await tester.tap(find.byKey(Key('registerButton')));
  await tester.pump();

  // Check for validation errors
  expect(find.text('Please enter your name'), findsOneWidget);
  expect(find.text('Please enter your email'), findsOneWidget);
  expect(find.text('Please enter your password'), findsOneWidget);
  expect(find.text('Please confirm your password'), findsOneWidget);
});


    testWidgets('Password visibility toggle works', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: RegisterScreen()),
      );

      // Verify initial state (password hidden)
      expect(find.byIcon(Icons.visibility), findsNWidgets(2));

      // Toggle password visibility for password field
      await tester.tap(find.byIcon(Icons.visibility).first);
      await tester.pump();

      // Toggle password visibility for confirm password field
      await tester.tap(find.byIcon(Icons.visibility).last);
      await tester.pump();

      // Ensure icons have changed
      expect(find.byIcon(Icons.visibility_off), findsNWidgets(2));
    });

   testWidgets('Invalid email shows error', (WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));

  // Enter an invalid email
  await tester.enterText(find.byKey(Key('emailField')), 'invalidEmail');
  
  // Scroll if needed to bring the button into view
  await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -200));
  await tester.pump();

  // Tap the "Register" button
  await tester.tap(find.byKey(Key('registerButton')));
  await tester.pump(); // Allows any animations to finish

  // Check for the error message
  expect(find.text('Only emails ending with @gmail.com are allowed'), findsOneWidget);
});


  });
}
