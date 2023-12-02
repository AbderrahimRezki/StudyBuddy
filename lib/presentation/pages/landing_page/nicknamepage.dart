import 'package:flutter/material.dart';

class NicknamePage extends StatefulWidget {
  @override
  _NicknamePageState createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  final _formKey = GlobalKey<FormState>();
  final _nicknameController = TextEditingController();

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(flex: 3),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Start by choosing\na nickname',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    TextFormField(
                      controller: _nicknameController,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Nickname',
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.7)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a nickname';
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //form validtion handling
                          }
                        },
                        child: Text('Let\'s Go!'),
                        style: ElevatedButton.styleFrom(
                          primary: orangeColor,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 16),
                          textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 20),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/image2.png',
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
