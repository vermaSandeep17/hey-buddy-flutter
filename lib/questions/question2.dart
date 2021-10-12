import 'package:flutter/material.dart';
import 'question3.dart';
import 'package:wave_slider/wave_slider.dart';
import 'package:hey_buddy/screens/tasks.dart';

class Question2 extends StatefulWidget {
  const Question2({Key key, this.meetValue}) : super(key: key);

  final int meetValue;

  @override
  _Question2State createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  int _happyValue = 0;

  dynamic happyCallBack(int value) {
    return Tasks(happyValue: value);
  }

  Text getDragValue(int drag) {
    int text;
    setState(() {
      text = drag;
      happyCallBack(text);
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
                'How happy do you feel today?',
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
                    _happyValue = (dragValue * 100).toInt();

                    getDragValue(_happyValue);
                  },
                ),
                getDragValue(_happyValue),
              ],
            ),
            TextButton(
              onPressed: () {
                // next question
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Question3(
                            happyValue: _happyValue,
                            meetValue: widget.meetValue,
                          )),
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
