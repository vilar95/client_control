import 'package:client_control/models/client.dart';
import 'package:client_control/models/client_type.dart';
import 'package:client_control/models/clients.dart';
import 'package:client_control/models/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Client Test', () {
    final eduardo = Client(
        name: 'Eduardo Vilar',
        email: 'e.vilar95@gmail.com',
        type: ClientType(name: 'gold', icon: Icons.star));
    test('Clients model should add new client', () {
      var clients = Clients(clients: []);
      clients.add(eduardo);
      clients.add(eduardo);
      expect(clients.clients, [eduardo, eduardo]);
    });
    test('Clients model should remove old client', () {
      var clients = Clients(clients: [eduardo, eduardo, eduardo]);
      clients.remove(0);
      clients.remove(1);
      expect(clients.clients, [eduardo]);
    });
  });
    group('Types Test', () {
    final gold = ClientType(
        name: 'gold', icon: Icons.star);
    test('Types model should add new type', () {
      var types = Types(types: []);
      types.add(gold);
      types.add(gold);
      expect(types.types, [gold, gold]);
    });
    test('Types model should remove old types', () {
      var types = Types(types: [gold, gold, gold]);
      types.remove(0);
      types.remove(1);
      expect(types.types, [gold]);
    });
  });
}
