//import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  // sing in anon

  Future singInAnon() async {
    try {
      //AuthResult result = await _auth.signInAnonymously();
      //FirebaseUser user = result.user;
      //return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with email ^ password

  // register with email & password

  // sign out
}
