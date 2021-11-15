import 'package:bloc/bloc.dart';
import 'package:bloc_login/domain/auth_models/email.dart';
import 'package:bloc_login/domain/auth_models/password.dart';
import 'package:bloc_login/domain/auth_models/name.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWidth(
      email: email,
      status: Formz.validate([state.name, email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWidth(
      password: password,
      status: Formz.validate([state.name, email, state.password]),
    ));
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWidth(
      name: name,
      status: Formz.validate([state.name, email, state.password]),
    ));
  }

  Future<void> signUpWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWidth(status: FormzStatus.submissionInProgress));
    try {
      final firebaseAuth = await _auth.createUserWithEmailAndPassword(
        email: state.email.value, password: state.password.value.toString());
      await firebaseAuth.user?.sendEmailVerification();
      emit(state.copyWidth(status: FormzStatus.submissionSuccess));
    } on
  }
}
