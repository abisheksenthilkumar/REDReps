import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'google_sign_in_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 936,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Shadow color
              blurRadius: 10, // Spread Radius
              offset: Offset(0, 6), // Shadow offset
            )
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: -51,
              top: -28,
              child: Container(
                width: 509,
                height: 900,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/login-bg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 41,
              top: 743, // Adjusted top position
              child: GoogleSignInButton(
                onSuccess: (GoogleSignInAccount user) {
                  // Handle sign-in success
                  print('User authenticated: ${user.displayName}');
                },
                onError: (String error) {
                  // Handle sign-in error
                  print('Authentication error: $error');
                },
              ),
            ),
            Positioned(
              left: 55,
              top: 378,
              child: SizedBox(
                width: 285,
                height: 224,
                child: Text(
                  'Unlock your potential, one rep at a time.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 55,
              top: 21,
              child: Container(
                width: 319,
                height: 343,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/redrepss.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
