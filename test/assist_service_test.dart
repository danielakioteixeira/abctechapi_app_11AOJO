import 'dart:convert';
import 'dart:io';

import 'package:abc_tech_app/model/assist.dart';
import 'package:abc_tech_app/provider/assist_provider.dart';
import 'package:abc_tech_app/service/assist_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'assist_service_test.mocks.dart';

@GenerateMocks([AssistanceProviderInterface])
void main() {
  late AssistanceProviderInterface provider_interface;
  late AssistanceService assistance_service;

  setUp(() async {
    provider_interface = MockAssistanceProviderInterface();
    assistance_service = AssistanceService().init(provider_interface);
    var json = File("${Directory.current.path}/test/resources/assists.json")
        .readAsStringSync();

    when(provider_interface.getAssists()).thenAnswer((_) async => Future.sync(
        () => Response(statusCode: HttpStatus.ok, body: jsonDecode(json))));
  });

  test('Test de listagem de assistencias', () async {
    List<Assist> list = await assistance_service.getAssists();
    expect(list.length, 15);
    expect(list[0].title, "name_0");
    expect(list[6].title, "name_6");
  });
}
