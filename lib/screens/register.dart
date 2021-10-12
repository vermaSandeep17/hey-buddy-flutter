import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hey_buddy/screens/logIn.dart';
import 'package:hey_buddy/screens/welcome.dart';
import 'package:hey_buddy/tab_bar.dart';
import 'package:hey_buddy/widget/bezier_container.dart';

class RegisterHere extends StatefulWidget {
  const RegisterHere({Key key}) : super(key: key);

  @override
  _RegisterHereState createState() => _RegisterHereState();
}

class _RegisterHereState extends State<RegisterHere> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        //back functionality
        Navigator.pop(context);
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

  Widget _loginAccount() {
    return InkWell(
      onTap: () {
        // log in screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LogIn(),
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
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
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

  Widget _emailPass() {
    return Column(
      children: [
        _entryField('Username'),
        _entryField('Email id'),
        SizedBox(
          height: 10.0,
        ),
        _entryField('Password', isPassword: true)
      ],
    );
  }

  Widget _registerButton() {
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
          'Register Now',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
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
                      height: height * .3,
                    ),
                    _title(),
                    SizedBox(
                      height: 50.0,
                    ),
                    _emailPass(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _registerButton(),
                    SizedBox(
                      height: height * .095,
                    ),
                    _loginAccount(),
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
