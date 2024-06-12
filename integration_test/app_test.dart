import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  
  testWidgets('Integration Test', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    //Testando tela inicial
    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    //Testando o Drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Gerenciar Clientes'), findsOneWidget);
    expect(find.text('Tipos de Clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);

    //Testando a navegação e a tela de Tipos de Clientes
    await tester.tap(find.text('Tipos de Clientes'));
    await tester.pumpAndSettle();

    expect(find.text('Tipos de cliente'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    
    expect(find.byIcon(Icons.menu), findsOneWidget); 
    expect(find.text('Platinum'), findsOneWidget);
    expect(find.text('Golden'), findsOneWidget);
    expect(find.text('Titanium'), findsOneWidget);
    expect(find.text('Diamond'), findsOneWidget);
  });
}
