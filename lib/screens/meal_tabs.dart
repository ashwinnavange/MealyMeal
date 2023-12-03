import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthtick/controllers/main_controller.dart';
import 'package:healthtick/widgets/buttons.dart';
import 'package:healthtick/widgets/headings.dart';
import 'package:healthtick/widgets/page_indicators.dart';
import 'package:healthtick/widgets/stopwatch.dart';
import 'package:healthtick/widgets/sound_button.dart';

class MealTab extends StatefulWidget {
  static const routeName = '/meal';
  const MealTab({super.key});

  @override
  State<MealTab> createState() => _MealTabState();
}

class _MealTabState extends State<MealTab> {
  late MainController mainController;
  late AudioPlayer player;

  @override
  void initState() {
    mainController = Get.find<MainController>();
    player = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData obj = MediaQuery.of(context);
    double height = obj.size.height;
    double width = obj.size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mindful Meal Timer"),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Get.back();
          },
          color: Colors.white,
        ),
      ),
      body: SizedBox(
        height: height - AppBar().preferredSize.height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * 0.05,
              child: const Row(
                children: [
                  Spacer(),
                  Indicator(),
                  Spacer(),
                ],
              ),
            ),
            const HeaderMessage(),
            const MealStopwatch(),
            const Spacer(),
            const SoundButton(),
            ControlButtons(player: player, height: height, width: width),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
