import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthtick/controllers/main_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MealStopwatch extends StatelessWidget {
  const MealStopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    return Container(
      height: height * 0.4,
      alignment: Alignment.center,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      child: Container(
        height: height * 0.32,
        padding: const EdgeInsets.all(10.0),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Obx(
          () => SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                showLabels: false,
                startAngle: 270,
                endAngle: 270,
                minimum: 0,
                maximum: 60,
                interval: 15,
                showAxisLine: false,
                tickOffset: 5,
                useRangeColorForAxis: true,
                labelsPosition: ElementsPosition.outside,
                majorTickStyle: const MajorTickStyle(length: 12, thickness: 4,color: Colors.black26),
                minorTickStyle: const MinorTickStyle(thickness: 2, length: 8,color: Colors.black26),
                minorTicksPerInterval: 14,
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: 60 - Get.find<MainController>().tickCount.value,
                    color: Colors.green,
                    startWidth: 8,
                    endWidth: 8,
                  ),
                ],
                pointers: const [],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Container(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          text: Get.find<MainController>().getFormattedTime(
                              30 - Get.find<MainController>().factorCount.value),
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: const [
                            TextSpan(
                              text: 'minutes remaining',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    angle: 0,
                    positionFactor: 0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
