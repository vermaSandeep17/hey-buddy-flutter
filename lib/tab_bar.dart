import 'package:flutter/material.dart';
import 'package:hey_buddy/screens/dashboard.dart';
import 'constants.dart';
import 'package:hey_buddy/screens/tasks.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar(
      {Key key, this.happyValue, this.meetValue, this.productiveValue})
      : super(key: key);

  final happyValue;
  final meetValue;
  final productiveValue;

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  Widget _title() {
    return RichText(
      text: TextSpan(
          text: 'h',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 22.0,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          children: [
            TextSpan(
              text: 'ey',
              style: TextStyle(color: Colors.black, fontSize: 22.0),
            ),
            TextSpan(
              text: 'buddy',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            )
          ]),
    );
  }

  Widget _dashTitle() {
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
    return MaterialApp(
      theme: ThemeData().copyWith(
        appBarTheme: Theme.of(context)
            .appBarTheme
            .copyWith(brightness: Brightness.light),
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 120.0,
            brightness: Brightness.dark,
            elevation: 0,
            backgroundColor: Colors.redAccent,
            title: _title(),
            bottom: TabBar(
              isScrollable: false,
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  color: Colors.white),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Tasks',
                      style: kCustomTabBarText,
                    ),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Dashboard',
                      style: kCustomTabBarText,
                    ),
                  ),
                )
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(child: _dashTitle()),
                ),
                ListTile(
                  title: Text(
                    'Get Professional Help',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                  onTap: () {
                    // add functionality
                  },
                ),
                ListTile(
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                  onTap: () {
                    // Add functionality
                  },
                ),
                ListTile(
                  title: Text(
                    'Clear All Accounts',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                  onTap: () {
                    // Add Functionality
                  },
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                Tasks(
                  happyValue: widget.happyValue,
                  meetValue: widget.meetValue,
                  productiveValue: widget.productiveValue,
                ),
                Dashboard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
