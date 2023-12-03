import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthtick/controllers/main_controller.dart';

class HeaderMessage extends StatefulWidget {
  const HeaderMessage({super.key});

  @override
  State<HeaderMessage> createState() => _HeaderMessageState();
}

class _HeaderMessageState extends State<HeaderMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: Get.height * 0.15,
        child: Obx(
          () => Column(
            children: [
              FittedBox(
                child: Text(
                  Get.find<MainController>().msgCaption.keys
                      .toList()[Get.find<MainController>().state.value],
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  Get.find<MainController>().msgCaption.values
                      .toList()[Get.find<MainController>().state.value],
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
