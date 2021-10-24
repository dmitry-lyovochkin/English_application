import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// /Flutter_Apprentice_v2.0.0.
class UserDao extends ChangeNotifier {
  final auth = FirebaseAuth.instance;
}

// bool isLoggedIn() {
  // return auth.currentUser != null;
// }

String? userId() {
  // return auth.currentUser?.uld;
}

String? email() {
  // return auth.currentUser?.email;
}

