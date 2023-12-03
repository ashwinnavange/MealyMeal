  import 'dart:async';

  import 'package:audioplayers/audioplayers.dart';
  import 'package:get/get.dart';

  class MainController extends GetxController {
    var isStarted = false.obs;
    get isPaused => !isStarted.value;
    var state = 0.obs;
    Map<String, String> msgCaption = {
      'Time to eat mindfully':
          'Its simple: eat slowly for ten minutes,\n rest for five, then finish your meal',
      'Nom Nom :)':
          'You have 10 minutes to eat before the pause.\nFocus on eating slowly',
      'Break Time':
          'Take a five-minute break to check in on \nyour level of fullness',
      'Finish your meal': 'You can eat until you feel full',
    };
    var tickCount = 0.0.obs;
    get tickCountInt => tickCount;
    var factorCount = 0.obs;
    var isMuted = false.obs;
    var buttonshow=false.obs;
    get buttonShow=>buttonshow;
    get muteState =>isMuted;

    Timer? _secondsTimer;
    var factor = 2;
    var cpyVar = 0;
    double elapsed = 0;

    void showButton(bool s){
      buttonshow.value=s;
    }

    void start() {
      isStarted.value = true;
    }

    void pause() {
      isStarted.value = false;
    }

    void resetApp() {
      isStarted.value = false;
      state.value = 0;
    }

    String getFormattedTime(int val) {
      String v = val.toStringAsFixed(0);
      String x = '00:${v == '0' ? '00' : (val < 10 ? '0$v' : '$val')}\n';
      return x;
    }

    void setCount(double count, AudioPlayer p) {
      tickCount.value = count;
      factorCount.value = (count ~/ factor).toInt();

      if (factorCount.value > 25) {
        if (!isMuted.value) {
          playSound(p);
        }
      }
      update();
    }

    void muteAndUnmute(bool s) {
      isMuted.value = s;
      update();
    }

    void playSound(AudioPlayer p) {
      if (factorCount.value > cpyVar) {
        cpyVar = factorCount.value;
        p.stop().then((value) {
          p.setSourceAsset('countdown_tick.mp3').then((value) => p.resume());
        });
      }
    }

    void resetCount() {
      tickCount.value = 0;
      factorCount.value = 0;
      cpyVar = 0;
      update();
    }

    void startCount(AudioPlayer p) {
      isStarted.value=true;
      if(state.value==0){
        state.value=1;
      }
      _secondsTimer ??=
        Timer.periodic(const Duration(milliseconds: 100), (timer) {
        elapsed = elapsed + 0.2;
        print(elapsed);
        setCount(elapsed, p);
        if (elapsed > 60) {
          resetCount();
          isStarted.value = false;
          elapsed = 0;
          stopCount();
          state.value += 1;
          if (state.value > 3) {
            state.value = 0;
          }
        }
      });
      update();
    }

    void stopCount() {
      _secondsTimer?.cancel();
      _secondsTimer = null;
      update();
    }

    void restartCount() {
      stopCount();
      elapsed = 0;
      resetCount();
      update();
    }
  }
