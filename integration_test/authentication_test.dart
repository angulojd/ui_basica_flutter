import 'package:f_testing_template/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  Future<Widget> createHomeScreen() async {
    WidgetsFlutterBinding.ensureInitialized();
    return const MyApp();
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Login sin creación de usuario", (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
  });

  testWidgets("Login -> signup -> creación usuario -> login no exitoso",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
  });

  testWidgets("Login -> signup -> creación usuario -> login exitoso -> logout",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
  });

  testWidgets(
      "Login -> signup -> creación usuario -> login éxitoso -> logout -> login exitoso",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
  });

  testWidgets(
      "Login -> signup -> creación usuario -> login éxitoso -> logout -> login no exitoso",
      (WidgetTester tester) async {
    Widget w = await createHomeScreen();
    await tester.pumpWidget(w);
  });
}
