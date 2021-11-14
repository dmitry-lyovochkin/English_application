import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState(isSignedIn: false)) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        emit(copyWidth(isSignedIn: false));
      } else {
        emit(copyWidth(isSignedIn: true));
      }
    });
  }
}
