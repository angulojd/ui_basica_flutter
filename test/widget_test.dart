// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_testing_template/ui/pages/authentication/login.dart';
import 'package:f_testing_template/ui/pages/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {

  testWidgets('Widget login validación @ email', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: Scaffold(body: LoginScreen(email: '', password: '',))));

        await tester.enterText(find.byKey(const Key('TextFormFieldLoginEmail')), 'arnaldogmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldLoginPassword')), '1234567');

        await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
        await tester.pump();

        expect(find.textContaining('Enter valid email address'), findsOneWidget);
      });

  testWidgets('Widget login validación campo vacio email', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: Scaffold(body: LoginScreen(email: '', password: '',))));

        await tester.enterText(find.byKey(const Key('TextFormFieldLoginEmail')), '');
        await tester.enterText(find.byKey(const Key('TextFormFieldLoginPassword')), '1234567');

        await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
        await tester.pump();

        expect(find.textContaining('Enter email'), findsOneWidget);
  });

  testWidgets('Widget login validación número de caracteres password', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: Scaffold(body: LoginScreen(email: '', password: '',))));

        await tester.enterText(find.byKey(const Key('TextFormFieldLoginEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldLoginPassword')), '12345');

        await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
        await tester.pump();

        expect(find.textContaining('Password should have at least 6 characters'), findsOneWidget);
  });

  testWidgets('Widget login validación campo vacio password', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: Scaffold(body: LoginScreen(email: '', password: '',))));

        await tester.enterText(find.byKey(const Key('TextFormFieldLoginEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldLoginPassword')), '');

        await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
        await tester.pump();

        expect(find.textContaining('Enter password'), findsOneWidget);
  });

  testWidgets('Widget login autenticación exitosa', (WidgetTester tester) async {

        await tester.pumpWidget(const GetMaterialApp(home: Scaffold(body: SignUpPage())));

        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpPassword')), '1234567');

        await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
        await tester.pumpAndSettle();

        // expect(find.byKey(const Key('TextFormFieldLoginEmail')), findsOneWidget);
        await tester.enterText(find.byKey(const Key('TextFormFieldLoginEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldLoginPassword')), '1234567');


        await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
        await tester.pumpAndSettle();

        expect(find.byKey(const Key('TextHomeHello')), findsOneWidget);
  });

  testWidgets('Widget login autenticación no exitosa', (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(home: Scaffold(body: SignUpPage())));

        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpPassword')), '1234567');

        await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
        await tester.pumpAndSettle();

        // expect(find.byKey(const Key('TextFormFieldLoginEmail')), findsOneWidget);
        await tester.enterText(find.byKey(const Key('TextFormFieldLoginEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldLoginPassword')), '12345678');


        await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
        await tester.pump();

        expect(find.textContaining('User or passwor nok'), findsOneWidget);
      });

    testWidgets('Widget signup validación @ email', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SignUpPage())));

        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpEmail')), 'arnaldogmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpPassword')), '1234567');

        await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
        await tester.pump();

        expect(find.textContaining('Enter valid email address'), findsOneWidget);
  });

  testWidgets('Widget signUp validación campo vacio email',(WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SignUpPage())));

        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpEmail')), '');
        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpPassword')), '1234567');

        await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
        await tester.pump();

        expect(find.textContaining('Enter email'), findsOneWidget);
  });

  testWidgets('Widget signUp validación número de caracteres password',(WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SignUpPage())));

        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpPassword')), '12345');

        await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
        await tester.pump();

        expect(find.textContaining('Password should have at least 6 characters'), findsOneWidget);
  });

  testWidgets('Widget signUp validación campo vacio password',(WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SignUpPage())));

        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpPassword')), '');

        await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
        await tester.pump();

        expect(find.textContaining('Enter password'), findsOneWidget);
  });

  testWidgets('Widget home nevegación detalle', (WidgetTester tester) async {
        await tester.pumpWidget(const MaterialApp(home: Scaffold(body: LoginScreen(email: '', password: '',))));

        await tester.enterText(find.byKey(const Key('TextFormFieldLoginEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldLoginPassword')), '');

        await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
        await tester.pump();

        expect(find.textContaining('Enter password'), findsOneWidget);
  });

  testWidgets('Widget login autenticación exitosa', (WidgetTester tester) async {

        await tester.pumpWidget(const GetMaterialApp(home: Scaffold(body: SignUpPage())));

        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpPassword')), '1234567');

        await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
        await tester.pumpAndSettle();


        await tester.enterText(find.byKey(const Key('TextFormFieldLoginEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldLoginPassword')), '1234567');


        await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key('ButtonHomeDetail')));
        await tester.pumpAndSettle();

        expect(find.text('Some detail'), findsOneWidget);
  });

  testWidgets('Widget home logout', (WidgetTester tester) async {
        await tester.pumpWidget(const GetMaterialApp(home: Scaffold(body: SignUpPage())));

        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldSignUpPassword')), '1234567');

        await tester.tap(find.byKey(const Key('ButtonSignUpSubmit')));
        await tester.pumpAndSettle();


        await tester.enterText(find.byKey(const Key('TextFormFieldLoginEmail')), 'arnaldo@gmail.com');
        await tester.enterText(find.byKey(const Key('TextFormFieldLoginPassword')), '1234567');


        await tester.tap(find.byKey(const Key('ButtonLoginSubmit')));
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key('ButtonHomeLogOff')));
        await tester.pumpAndSettle();

        expect(find.byKey(const Key('TextFormFieldLoginEmail')), findsWidgets);
  });
}
