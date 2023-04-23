import 'package:abc_tech_app/model/assist.dart';
import 'package:abc_tech_app/provider/assist_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';

class AssistanceService extends GetxService {
  late AssistanceProviderInterface _assistance_provider;

  AssistanceService init(AssistanceProviderInterface provider_interface) {
    _assistance_provider = provider_interface;
    return this;
  }

  Future<List<Assist>> getAssists() async {
    Response response = await _assistance_provider.getAssists();
    if (response.hasError) {
      return Future.error(ErrorDescription("Erro na conexão"));
    }

    try {
      List<Assist> list =
          response.body.map<Assist>((item) => Assist.fromMap(item)).toList();
      return Future.sync(() => list);
    } catch (e) {
      e.printError();
      return Future.error(ErrorDescription(e.toString()));
    }
  }
}
