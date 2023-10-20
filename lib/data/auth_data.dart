import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do/data/firestore.dart';

abstract class AuthenticationDataSource {
  Future<void> register(String email, String password, String passwordConfirm);
  Future<void> login(String email, String password);
  final _auth = FirebaseAuth.instance;
}

class AuthenticateRemote extends AuthenticationDataSource {
  @override
  Future<User?> login(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return credential.user;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print(error.code);
        Fluttertoast.showToast(msg: error.code, gravity: ToastGravity.CENTER);
      }
      print(error.code);
      Fluttertoast.showToast(
          msg: error.message! + error.toString(), gravity: ToastGravity.TOP);
    }
    return null;
  }

  @override
  Future<void> register(
      String email, String password, String passwordConfirm) async {
    if (password == passwordConfirm) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) {
        FirebaseDatasource().createUser(email);
      });
    }
  }
}
