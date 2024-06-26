import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password
}) async{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password
  }) async{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<String?> getUserEmail() async {
    User? user = _auth.currentUser;
    if (user != null) {
      return user.email;
    }
    return null;
  }


  Future<void> signOut() async{
    await _auth.signOut();
  }

}
