abstract class AuthState {}

class AuthInit extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String data;

  AuthSuccess({required String this.data});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
