import 'package:flutter/material.dart';
import 'package:fokus/app/shared/utils/app_config.dart';
import 'package:fokus/app/view_model/timer_view_model.dart';

class TimerWidget extends StatefulWidget {
  final int initialMinutes;

  const TimerWidget({super.key, required this.initialMinutes});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final timerViewModel = TimerViewModel();

  final isPauseNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timerViewModel.stopTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(20, 68, 128, 0.5),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xff144480), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: timerViewModel,
            builder: (context, child) {
              final duration = timerViewModel.duration;
              return Text(
                "${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'monospace',
                ),
              );
            },
          ),
          SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ListenableBuilder(
              listenable: timerViewModel,
              builder: (context, child) {
                return ElevatedButton(
                  onPressed: () {
                    isPauseNotifier.value = false;
                    if (timerViewModel.isPlayning) {
                      timerViewModel.stopTimer();
                    } else {
                      timerViewModel.startTimer(
                        widget.initialMinutes,
                        isPauseNotifier,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: timerViewModel.isPlayning
                        ? Colors.red
                        : AppConfig.buttonColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        timerViewModel.isPlayning
                            ? Icons.stop
                            : Icons.play_arrow,
                        color: AppConfig.backgroundColor,
                      ),
                      SizedBox(width: 10),
                      Text(
                        timerViewModel.isPlayning ? "Parar" : "Iniciar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppConfig.backgroundColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: isPauseNotifier,
            builder: (context, value, child) {
              return ListenableBuilder(
                listenable: timerViewModel,
                builder: (context, child) {
                  if (!timerViewModel.isPlayning) {
                    return SizedBox.shrink();
                  }
                  return SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        isPauseNotifier.value = !value;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            value ? Icons.play_circle : Icons.pause,
                            color: Colors.green,
                          ),
                          SizedBox(width: 10),
                          Text(
                            value ? 'Retomar' : 'Pausar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppConfig.backgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
