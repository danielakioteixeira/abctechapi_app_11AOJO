import 'package:abc_tech_app/pages/home_bind.dart';
import 'package:abc_tech_app/pages/home_page.dart';
import 'package:abc_tech_app/pages/order_bind.dart';
import 'package:abc_tech_app/pages/order_page.dart';
import 'package:abc_tech_app/provider/assistance_provider.dart';
import 'package:abc_tech_app/services/assistance_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

void initServices() async {
  await Get.putAsync(() => AssistanceService().init(AssistanceProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: "/services",
            page: () => const HomePage(),
            binding: HomeBind()),
        GetPage(name: "/", page: () => const OrderPage(), binding: OrderBind())
      ],
    );
  }
}
