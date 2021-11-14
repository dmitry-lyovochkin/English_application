part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({required this.isSignedIn});

  final bool isSignedIn;
  @override
  List<Object> get props => [isSignedIn];
}

AuthState copyWidth({required bool isSignedIn}) {
  return AuthState(isSignedIn: isSignedIn);
}