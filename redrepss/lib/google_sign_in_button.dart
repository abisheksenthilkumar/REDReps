import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function(GoogleSignInAccount)? onSuccess;
  final Function(String)? onError;

  const GoogleSignInButton({Key? key, this.onSuccess, this.onError}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 349,
      height: 60, 
      child: TextButton(
        onPressed: () {
          _handleSignIn(context);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 1, color: Color(0x00E2F0F6)),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/google logo.png"), 
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 10), // Add some space between logo and text
            Text(
              'Login with Google',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignIn(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        onSuccess?.call(googleSignInAccount);
      } else {
        onError?.call('Sign in cancelled');
      }
    } catch (error) {
      onError?.call(error.toString());
    }
  }
}
