import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthtick/controllers/main_controller.dart';

class Indicator extends StatefulWidget {
  const Indicator({super.key});

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: List.generate(
          3,
          (index) => Container(
            height: Get.find<MainController>().state.value == index + 1
                ? 18
                : 12,
            width: Get.find<MainController>().state.value == index + 1
                ? 18
                : 12,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.find<MainController>().state.value == index + 1
                  ? Colors.white
                  : Colors.white30,
            ),
          ),
        ),
      ),
    );
  }
}
