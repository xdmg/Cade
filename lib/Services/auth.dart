import 'package:firebase_auth/firebase_auth.dart';
import 'package:daily_coffee/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Auth change user stream;
  Stream<User?> get currentUser => _auth.authStateChanges();

  //Sign in;
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      return getMessageFromErrorCode(e.code);
    }
  }

  //Register;
  Future register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await DatabaseService(uid: result.user!.uid).updateBalance(5.00);
      return result.user;
    } on FirebaseAuthException catch (e) {
      return getMessageFromErrorCode(e.code);
    }
  }

  //Sign out;
  Future signOut() async {
    try {
      return await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      return getMessageFromErrorCode(e.code);
    }
  }

  //Convert errors into strings;
  String getMessageFromErrorCode(dynamic e) {
    switch (e) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Account already exists, please login.";

      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";

      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";

      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Provided Email is invalid";

      case "weak-password":
        return "Password must be at least 6 characters long";

      default:
        return "Login failed. Please try again.";
    }
  }
}
