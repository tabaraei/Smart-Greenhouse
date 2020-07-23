import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'automatic_services.dart';

// events
abstract class AutomaticIrrigationEvent extends Equatable {}

class GetThresholdEvent extends AutomaticIrrigationEvent {
  @override
  List<Object> get props => [];
}

class ChangingThresholdEvent extends AutomaticIrrigationEvent {
  final double value;

  ChangingThresholdEvent({this.value});

  @override
  List<Object> get props => [value];
}

class UpdateThresholdEvent extends AutomaticIrrigationEvent {
  @override
  List<Object> get props => [];
}

// bloc
class AutomaticIrrigationBloc
    extends Bloc<AutomaticIrrigationEvent, Threshold> {
  @override
  Threshold get initialState => Threshold(threshold: 68);

  @override
  Stream<Threshold> mapEventToState(
    AutomaticIrrigationEvent event,
  ) async* {
    if (event is UpdateThresholdEvent) {
      Threshold threshold = await Threshold.updateThreshold(state.threshold);
      yield threshold;
    } else if (event is ChangingThresholdEvent) {
      if (event.value >= 0 && state.threshold > 0) {
        yield Threshold(threshold: state.threshold - 1);
      } else if (event.value != 0 && state.threshold < 100) {
        yield Threshold(threshold: state.threshold + 1);
      }
    } else if (event is GetThresholdEvent) {
      Threshold threshold = await Threshold.getThreshold();
      yield threshold;
    }
  }
}
