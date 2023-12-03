import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthtick/controllers/main_controller.dart';

class ControlButtons extends StatefulWidget {
  final AudioPlayer player;
  final double height;
  final double width;

  const ControlButtons({
    super.key,
    required this.player,
    required this.height,
    required this.width,
  });

  @override
  State<ControlButtons> createState() => _ControlButtonsState();
}

class _ControlButtonsState extends State<ControlButtons> {
  @override
  Widget build(BuildContext context) {
    var prov = Get.find<MainController>();
    
    return Column(
      children: [
        GetBuilder<MainController>(
          builder: (_) {
            return SizedBox(
              width: Get.width * 0.6,
              child: ElevatedButton(
                onPressed: () {
                  // print(prov.tickCountInt.value);
                  // print(prov.isStarted.value);
                  if (prov.isStarted.value && prov.tickCountInt.value.toInt() > 0) {
                    prov.pause();
                    prov.stopCount();
                  } else {
                    prov.start();
                    prov.startCount(widget.player);
                  }
                  prov.showButton(true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(177, 232, 193, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Obx(() => Text(
                      prov.tickCountInt.value == 0 ? "Start" : prov.isStarted.value == false ? 'Resume' : 'Pause',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    )),
              ),
            );
          },
        ),
        Obx(
          () => prov.buttonShow.value == true
              ? SizedBox(
                  width: Get.width * 0.6,
                  child: ElevatedButton(
                    onPressed: () {
                      prov.pause();
                      prov.restartCount();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(22, 20, 33, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                    child: const Text(
                      "LET'S STOP I'M FULL NOW",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
