import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../template/colors.dart';
import '../../../logic/home/home_bloc.dart';
import '../../../logic/home/home_services.dart';

class Gauge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowRecordsBloc, Record>(
      builder: (context, state) {
        return SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 100,
              minorTicksPerInterval: 9,
              showAxisLine: false,
              labelsPosition: ElementsPosition.outside,
              ticksPosition: ElementsPosition.outside,
              majorTickStyle: MajorTickStyle(
                color: grey,
                length: 10,
                thickness: 3,
              ),
              minorTickStyle: MinorTickStyle(
                color: grey,
              ),
              axisLabelStyle: GaugeTextStyle(
                fontFamily: 'IranYekan',
                fontSize: 24,
                color: grey,
              ),
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 30,
                  endValue: 100,
                  gradient: SweepGradient(
                    // colors: [Color(0xffFFC476), Color(0xff49BBFA)],
                    colors: [gaugeStartColor, gaugeEndColor],
                    stops: [0, 1],
                  ),
                  startWidth: 5,
                  endWidth: 30,
                  rangeOffset: 15,
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  enableAnimation: true,
                  value: state.soilMoisture,
                  needleColor: grey,
                  needleLength: 0.73,
                  needleStartWidth: 0,
                  needleEndWidth: 4,
                  knobStyle: KnobStyle(color: grey),
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  angle: 90,
                  positionFactor: 0.6,
                  widget: Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${state.soilMoisture.toInt()}%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'IranYekan',
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: white,
                          ),
                        ),
                        Text(
                          'رطوبت خاک',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'IranYekan',
                            fontSize: 20,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
