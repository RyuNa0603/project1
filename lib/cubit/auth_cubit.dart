import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/cubit/auth_state.dart';
import 'package:project1/repo/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInit());

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      final response = await AuthRepo().signUp(email, password);
      emit(AuthSuccess(data: response));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
