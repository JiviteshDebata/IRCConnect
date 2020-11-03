import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_poc/services/UserAccountRegister.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthenticator {
  final _auth = FirebaseAuth.instance;
  UserCredential userCredential;
  User currentUser;
  Future<String> login(String email, String password) async {
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Logged In");
      currentUser = userCredential.user;
      print(currentUser.uid);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("uid", currentUser.uid);
      preferences.setString("email", currentUser.email);
      preferences.setString("password", password);
    } catch (exception) {
      print("Exception");
      print(exception);
    }
  }

  Future<String> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      currentUser = userCredential.user;
      UserAccountRegister userAccountRegister =
          UserAccountRegister(currentUser: currentUser);
      userAccountRegister.AddUser();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("uid", currentUser.uid);
      preferences.setString("email", currentUser.email);
      preferences.setString("password", password);
    } catch (exception) {
      print("couldnt register");
      print(exception);
    }
  }
}
