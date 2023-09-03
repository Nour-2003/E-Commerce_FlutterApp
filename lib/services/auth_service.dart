import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      try {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;//obtain auth email from request
        //create a new credential for user
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, //access fire base
          idToken: googleAuth.idToken,//user information
        );

        final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);// to signing
        final User? user = authResult.user;

        // Handle successful sign-in
      } catch (error) {
        // Handle sign-in error
        print("Google Sign-In Error: $error"); //handling error
      }
    }
  }

}