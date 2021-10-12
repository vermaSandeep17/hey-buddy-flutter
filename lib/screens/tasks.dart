import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hey_buddy/constants.dart';
import 'package:hey_buddy/questions/question1.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key key, this.happyValue, this.meetValue, this.productiveValue})
      : super(key: key);

  final int happyValue;
  final int meetValue;
  final int productiveValue;

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  static bool timeUP = false;
  var quizTakenTime;

  Timer checkTimer() {
    quizTakenTime = TimeOfDay.now();
    int hoursLeft = 23 - quizTakenTime.hour;
    int minutesLeft = 60 - quizTakenTime.minute;
    var timeout = Duration(hours: hoursLeft, minutes: minutesLeft);
    return Timer(timeout, () => timeUP = false);
  }

  bool isQuizTaken = false;
  Widget askQuestions() {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                leading: Icon(Icons.message),
                title: Text(
                  'Ready to answer a few questions?',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Text('It will only take a minute'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      'Yes!',
                      style: kCardTextButtonStyle,
                    ),
                    onPressed: () {
                      // yes press functionality
                      setState(() {
                        isQuizTaken = true;
                        timeUP = checkTimer().isActive;
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Question1(),
                        ),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      // no press functionality
                    },
                    child: Text(
                      'Not now',
                      style: kCardTextButtonStyle,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget updateUI() {
    var justCheck;
    setState(() {
      justCheck = (!isQuizTaken && !timeUP) ? askQuestions() : tasksMethod();
    });
    return justCheck;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: updateUI(),
    );
  }

  ListView tasksMethod() {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        if (widget.happyValue < 50)
          TasksCard(
            imageName: 'assets/images/happy_people.jpg',
            cardTitle: 'Listen some music! today',
          ),
        SizedBox(
          height: 10.0,
        ),
        if (widget.productiveValue < 50)
          TasksCard(
            imageName: 'assets/images/listen_music.jpg',
            cardTitle: 'Go out! Do some party today',
          ),
        SizedBox(
          height: 10.0,
        ),
        if (widget.meetValue < 50)
          TasksCard(
            imageName: 'assets/images/party.jpg',
            cardTitle: 'Go out! Meet few people today',
          ),
      ],
    );
  }
}

class TasksCard extends StatelessWidget {
  const TasksCard({
    this.imageName,
    this.cardTitle,
    Key key,
  }) : super(key: key);

  final String imageName;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageName,
            width: 400.0,
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cardTitle,
              style: kCardTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
