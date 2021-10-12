import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hey_buddy/tab_bar.dart';
import 'package:hey_buddy/widget/bezier_container.dart';
import 'package:hey_buddy/screens/register.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        //back functionality
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Icon(
                Icons.keyboard_arrow_left,
                size: 20.0,
              ),
            ),
            Text(
              'Back',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      text: TextSpan(
          text: 'h',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            color: Colors.redAccent,
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
                color: Colors.redAccent,
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
            builder: (context) => CustomTabBar(),
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
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2,
              )
            ]),
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 1.0,
            ),
          ),
        ),
        Text('or'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 1.0,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        )
      ],
    );
  }

  Widget _emailPass() {
    return Column(
      children: [
        _entryField('Email id'),
        SizedBox(
          height: 10.0,
        ),
        _entryField('Password', isPassword: true)
      ],
    );
  }

  Widget _googleButton() {
    return InkWell(
      onTap: () {
        // google sign in
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 15.0),
        decoration: BoxDecoration(
          color: Color(0xff4285F4),
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Color(0xff4285F4), width: 2.0),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/imageGoogle.png',
                  height: 20.0,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff4285F4),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                ),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _registerAccount() {
    return InkWell(
      onTap: () {
        //
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterHere(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * .2,
                    ),
                    _title(),
                    SizedBox(
                      height: 50.0,
                    ),
                    _emailPass(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _logInButton(),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // forgot pass button
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    _divider(),
                    _googleButton(),
                    SizedBox(
                      height: height * .095,
                    ),
                    _registerAccount(),
                  ],
                ),
              ),
            ),
            Positioned(
              child: _backButton(),
              top: 40,
              left: 0,
            ),
          ],
        ),
      ),
    );
  }
}
