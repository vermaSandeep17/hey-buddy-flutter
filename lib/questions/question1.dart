import 'package:flutter/material.dart';
import 'question2.dart';
import 'package:wave_slider/wave_slider.dart';

class Question1 extends StatefulWidget {
  const Question1({Key key}) : super(key: key);

  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  int _meetValue = 0;

  Text getDragValue(int drag) {
    int text;
    setState(() {
      text = drag;
    });

    return Text(
      '$text',
      style: TextStyle(
          fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xff8a2387),
              Color(0xffe94057),
              Color(0xfff27121)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 100.0,
              ),
              child: Text(
                'How many people did you meet today?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                WaveSlider(
                  displayTrackball: true,
                  onChanged: (double dragValue) {
                    _meetValue = (dragValue * 100).toInt();

                    getDragValue(_meetValue);
                  },
                ),
                getDragValue(_meetValue),
              ],
            ),
            TextButton(
              onPressed: () {
                // next question
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Question2(
                      meetValue: _meetValue,
                    ),
                  ),
                );
              },
              child: Text(
                'NEXT',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
