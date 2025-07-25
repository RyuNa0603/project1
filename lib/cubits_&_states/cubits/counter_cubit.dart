import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void subtraction() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}
