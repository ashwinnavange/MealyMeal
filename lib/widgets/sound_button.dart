import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthtick/controllers/main_controller.dart';

class SoundButton extends StatelessWidget {
  const SoundButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Switch(
                  value: !mainController.isMuted.value,
                  onChanged: (value) {
                    mainController.muteAndUnmute(!value);
                  },
                  inactiveTrackColor: Colors.grey,
                  activeTrackColor: Colors.green,
                  thumbColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.white.withOpacity(.48);
                      }
                      return Colors.white;
                    },
                  ),
                ),
              ),
              GetBuilder<MainController>(builder: (_) {
                return Text(
                  'Sound ${mainController.isMuted.value ? "Off" : "On"}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
