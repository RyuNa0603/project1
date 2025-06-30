import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordVisibilityCubit extends Cubit<bool> {
  PasswordVisibilityCubit() : super(false);

  void toggleVisibility() {
    if (state == true) {
      emit(false);
    } else {
      emit(true);
    }
  }

  // void showPassword() {
  //   if (!state) emit(true);
  // }

  // void hidePassword() {
  //   if (state) emit(false);
  // }
}
