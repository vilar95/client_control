import 'package:client_control/components/hamburger_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing the Menu', () {
    testWidgets('Testing the menu "menu"', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Menu'), findsOneWidget);
    });
    testWidgets('Testing the menu "Gerenciar Clientes"', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Gerenciar Clientes'), findsOneWidget);
    });

    testWidgets('Testing the menu "Tipos de Clientes"', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Tipos de Clientes'), findsOneWidget);
    });
    testWidgets('Testing the menu "Tipos de Clientes"', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Tipos de Clientes'), findsOneWidget);
    });
    testWidgets('Testing the menu "Sair"', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Sair'), findsOneWidget);
    });
  });
}
