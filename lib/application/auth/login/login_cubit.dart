import 'package:bloc/bloc.dart';
import 'package:english_application/domain/auth_models/email.dart';
import 'package:english_application/domain/auth_models/password.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWidth(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanges(String value) {
    final password = Password.dirty(value);
    emit(state.copyWidth(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> performLogin(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    try {
      await FirebaseAuthOAuth().openSignInFlow(provider, scopes, parameters);
    } on PlatformException catch (error) {
      emit(state.copyWidth(exceptionError: error.toString()));
    }
  }

  Future<void> loginWithCredentials() async {
    emit(state.copyWidth(status: FormzStatus.submissionSuccess));
    try {
      await _auth.signInWithEmailAndPassword(
          email: state.email.value, password: state.password.value);
      emit(state.copyWidth(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWidth(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future signInWithGoogle() async {
    emit(state.copyWidth(status: FormzStatus.submissionInProgress));
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        emit(state.copyWidth(status: FormzStatus.submissionSuccess));
      });
    } on FirebaseAuthException catch (e) {
      emit(state.copyWidth(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future signWithTwitter() async {
    emit(state.copyWidth(status: FormzStatus.submissionInProgress));
    try {
      await performLogin("twitter.com", ["user:email"], {"lang": "en"});
      emit(state.copyWidth(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWidth(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future signInWithMicrosoft() async {
    emit(state.copyWidth(status: FormzStatus.submissionInProgress));
    try {
      await performLogin("microsoft.com", ["user:email"], {"lang": "en"});
      emit(state.copyWidth(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWidth(
          status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future<void> resetPassword() async {
    emit(state.copyWidth(status: FormzStatus.submissionInProgress));
    try {
      await FirebaseAuth.instance
        .sendPasswordResetEmail(email: state.email.value);
      emit(state.copyWidth(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWidth(
        status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }

  Future<void> signOut() async {
    emit(state.copyWidth(status: FormzStatus.submissionInProgress));
    try {
      return await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      emit(state.copyWidth(
        status: FormzStatus.submissionFailure, exceptionError: e.message));
    }
  }
}

