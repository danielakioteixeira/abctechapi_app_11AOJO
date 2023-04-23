import 'package:abc_tech_app/model/assist.dart';
import 'package:abc_tech_app/service/assist_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class AssistanceController extends GetxController
    with StateMixin<List<Assist>> {
  late AssistanceService _assistance_service;

  @override
  void onInit() {
    super.onInit();
    _assistance_service = Get.find<AssistanceService>();
    getAssistanceList();
  }

  void getAssistanceList() {
    change(null, status: RxStatus.loading());

    _assistance_service
        .getAssists()
        .then((value) => change(value, status: RxStatus.success()))
        .onError((error, stackTrace) => change([], status: RxStatus.error()));
  }
}
