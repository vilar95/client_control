import 'package:client_control/models/clients.dart';
import 'package:client_control/models/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:client_control/main.dart' as app;
import 'package:provider/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration Test', (tester) async {
    final providerKey = GlobalKey();
    app.main(list: [], providerKey: providerKey);
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

    //Testando a criação de um Tipos de Cliente
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'Ferro');

    await tester.tap(find.text('Selecionar icone'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.card_giftcard));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();

    expect(find.text('Ferro'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

    expect(
        Provider.of<Types>(providerKey.currentContext!, listen: false)
            .types
            .last
            .name,
        'Ferro');
    expect(
        Provider.of<Types>(providerKey.currentContext!, listen: false)
            .types
            .last
            .icon,
        Icons.card_giftcard);

    //Testando novo Cliente
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Gerenciar Clientes'));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.enterText(find.byKey(const Key('NameKey')), 'Eduardo Vilar');
    await tester.enterText(
        find.byKey(const Key('EmailKey')), 'e.vilar95@gmail.com');
    await tester.tap(find.byIcon(Icons.arrow_downward));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Ferro').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();

    expect(find.text('Eduardo Vilar (Ferro)'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

    expect(
        Provider.of<Clients>(providerKey.currentContext!, listen: false)
            .clients
            .last
            .name,
        'Eduardo Vilar');
    expect(
        Provider.of<Clients>(providerKey.currentContext!, listen: false)
            .clients
            .last
            .email,
        'e.vilar95@gmail.com');

    await tester.drag(find.text('Eduardo Vilar (Ferro)'), const Offset(500, 0));

    // //Testando sair da aplicação
    // await tester.tap(find.byIcon(Icons.menu));
    // await tester.pumpAndSettle();
    // await tester.tap(find.text('Sair'));
  });
}
