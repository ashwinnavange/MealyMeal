import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthtick/screens/meal_tabs.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HealthTick'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Go to Meal Tab!', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(MealTab.routeName);
                },
                child: const Text('Meal Tab'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
