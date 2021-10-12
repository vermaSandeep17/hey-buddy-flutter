import 'package:flutter/material.dart';
import 'package:hey_buddy/screens/tasks.dart';
import 'package:wave_slider/wave_slider.dart';
import 'package:hey_buddy/tab_bar.dart';

class Question3 extends StatefulWidget {
  const Question3({Key key, this.happyValue, this.meetValue}) : super(key: key);

  final int happyValue;
  final int meetValue;

  @override
  _Question3State createState() => _Question3State();
}

class _Question3State extends State<Question3> {
  int _productiveValue = 0;

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
                'How productive do you feel today?',
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
                    _productiveValue = (dragValue * 100).toInt();

                    getDragValue(_productiveValue);
                  },
                ),
                getDragValue(_productiveValue),
              ],
            ),
            TextButton(
              onPressed: () {
                // next question
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomTabBar(
                      happyValue: widget.happyValue,
                      meetValue: widget.meetValue,
                      productiveValue: _productiveValue,
                    ),
                  ),
                );
              },
              child: Text(
                'END',
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
