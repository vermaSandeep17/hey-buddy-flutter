import 'package:flutter/material.dart';
import 'package:hey_buddy/constants.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/party.jpg',
                width: 500.0,
                height: 200.0,
              ),
              Text(
                'Congratulations! You met more people today',
                style: kCardTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // complete functionality share
                    },
                    child: Text(
                      'Share',
                      style: kCardTextButtonStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // dismiss functionality
                    },
                    child: Text(
                      'Dismiss',
                      style: kCardTextButtonStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
