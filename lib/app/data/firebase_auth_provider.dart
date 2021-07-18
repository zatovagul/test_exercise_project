import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthProvider{
  User firebaseUser;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isAlreadyAuthenticated()async{
    firebaseUser = _auth.currentUser;
    if(firebaseUser!=null){
      print(await firebaseUser.getIdToken());
      return true;
    }
    else{
      return false;
    }
  }
  Future<void> logIn(String email, String password)async{
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      isAlreadyAuthenticated();
    }
    catch(err){
      Get.snackbar("Error", err.toString());
    }
  }
  Future<void> registrate(String email, String password)async{
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      isAlreadyAuthenticated();
    }
    catch(err){
      Get.snackbar("Error", err.toString());
    }
  }
  Future<String> getJWT() async {
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      final jwt = await firebaseUser.getIdToken();
      return jwt;
    } else {
      return '';
    }
  }
}
final instanceFireBaseAuthProvider = FirebaseAuthProvider();