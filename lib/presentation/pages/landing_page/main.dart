import 'package:flutter/material.dart';
import '/nicknamepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyBuddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StudyBuddyPage(),
    );
  }
}

class StudyBuddyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color blueColor = Color(0xFF007BFF);
    final Color orangeColor = Color(0xFFF39C12);

    return Scaffold(
      backgroundColor: blueColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 60),
                  Text(
                    'StudyBuddy',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Unlock your academic\npotential',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white.withOpacity(0.9),
                      letterSpacing: 0.8,
                    ),
                  ),
                  SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NicknamePage()),
                      );
                    },
                    child: Text('Get Started'),
                    style: ElevatedButton.styleFrom(
                      primary: orangeColor,
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                '/assets/image.png',
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
