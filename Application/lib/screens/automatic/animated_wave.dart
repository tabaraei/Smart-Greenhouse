import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_progress_widget/wave_progress.dart';
import '../../template/colors.dart';
import '../../logic/automatic/automatic_bloc.dart';
import '../../logic/automatic/automatic_services.dart' as irrigation;

class AnimatedWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutomaticIrrigationBloc, irrigation.Threshold>(
      builder: (context, state) {
        return GestureDetector(
          onVerticalDragUpdate: (details) {
            BlocProvider.of<AutomaticIrrigationBloc>(context)
                .add(ChangingThresholdEvent(value: details.delta.dy));
          },
          onVerticalDragEnd: (details) {
            BlocProvider.of<AutomaticIrrigationBloc>(context)
                .add(UpdateThresholdEvent());
          },
          child: BlocBuilder<AutomaticIrrigationBloc, irrigation.Threshold>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  WaveProgress(
                    MediaQuery.of(context).size.width * 0.6,
                    automaticWaveColor,
                    automaticSliderColor,
                    state.threshold,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        state.threshold.toInt().toString() + '%',
                        style: TextStyle(
                          fontFamily: 'IranYekan',
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                      ),
                      Text(
                        'آستانه رطوبت خاک',
                        style: TextStyle(
                          fontFamily: 'IranYekan',
                          fontSize: 22,
                          color: white,
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
