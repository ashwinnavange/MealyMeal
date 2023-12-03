import 'package:flutter/material.dart';
import 'package:healthtick/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:healthtick/controllers/main_controller.dart';
import 'package:healthtick/screens/meal_tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HealthTick',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      getPages: [
      GetPage(
        name: MealTab.routeName,
        page: () => const MealTab(),
      ),
      GetPage(
        name: HomeScreen.routeName,
        page: () => const HomeScreen(),
      ),
    ],
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      initialBinding: BindingsBuilder(() {
        Get.put(MainController());
      }),
    );
  }
}
