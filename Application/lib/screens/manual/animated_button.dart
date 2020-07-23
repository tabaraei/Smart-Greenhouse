import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
import '../../template/colors.dart';
import '../../logic/manual/manual_bloc.dart';
import '../../logic/manual/manual_services.dart';

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManualIrrigationBloc, Toggle>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (state.toggle) {
              _controller.reset();
              BlocProvider.of<ManualIrrigationBloc>(context)
                  .add(EndIrrigationEvent());
            } else {
              _controller.stop();
              _controller.reset();
              _controller.repeat(
                period: Duration(seconds: 1),
              );
              BlocProvider.of<ManualIrrigationBloc>(context)
                  .add(StartIrrigationEvent());
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CustomPaint(
                painter: SpritePainter(_controller),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
              Text(
                state.title,
                style: TextStyle(
                  color: white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IranYekan',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SpritePainter extends CustomPainter {
  final Animation<double> _animation;

  SpritePainter(this._animation) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = manualAnimationColor.withOpacity(opacity);

    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 4);

    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}
