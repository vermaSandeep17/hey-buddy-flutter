import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hey_buddy/screens/logIn.dart';
import 'package:hey_buddy/screens/register.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget _title() {
    return RichText(
      text: TextSpan(
          text: 'h',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          children: [
            TextSpan(
              text: 'ey',
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
            TextSpan(
              text: 'buddy',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            )
          ]),
    );
  }

  Widget _logInButton() {
    return InkWell(
      onTap: () {
        // login button
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LogIn(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.redAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return InkWell(
      onTap: () {
        // login button
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterHere(),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.white, width: 2.0),
        ),
        child: Text(
          'Register now',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(color: Colors.redAccent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _title(),
            SizedBox(
              height: 80,
            ),
            _logInButton(),
            SizedBox(
              height: 20.0,
            ),
            _registerButton()
          ],
        ),
      ),
    );
  }
}
