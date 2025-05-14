import 'package:bloc/bloc.dart';


part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<Increment>((event, emit) {
        emit(CounterState(count: state.count+1));
    });
    on<Decrement>((event, emit) {
      emit(CounterState(count: state.count-1));
    });
  }
}
