import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pin Pad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PinPadScreen(),
    );
  }
}

class PinPadScreen extends StatefulWidget {
  @override
  _PinPadScreenState createState() => _PinPadScreenState();
}

class _PinPadScreenState extends State<PinPadScreen> {
  String pin = '';

  void _onKeyPressed(dynamic keyPressed) {
    setState(() {
      if (keyPressed == Icons.clear) {
        // Clear the pin
        pin = '';
      } else if (keyPressed == 'X') {
        // Clear all entered pin digits
        pin = '';
      } else if (keyPressed == Icons.backspace) {
        // Remove the last character from the pin
        if (pin.isNotEmpty) {
          pin = pin.substring(0, pin.length - 1);
        }
      } else {
        // Append the pressed key to the pin
        if (pin.length < 6) {
          pin += keyPressed;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.security,
              size: 70.0,
            ),
            SizedBox(height: 10.0),
            Text('PIN LOGIN'),
            SizedBox(height: 100.0), // Increased padding between AppBar and Text
            Text(
              '${pin.substring(0, pin.length)}${'_' * (6 - pin.length)}',
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(height: 50.0), // Increased padding between Text and Buttons
            // Pin Pad Buttons
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PinButton('1', onPressed: _onKeyPressed),
                    PinButton('2', onPressed: _onKeyPressed),
                    PinButton('3', onPressed: _onKeyPressed),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PinButton('4', onPressed: _onKeyPressed),
                    PinButton('5', onPressed: _onKeyPressed),
                    PinButton('6', onPressed: _onKeyPressed),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PinButton('7', onPressed: _onKeyPressed),
                    PinButton('8', onPressed: _onKeyPressed),
                    PinButton('9', onPressed: _onKeyPressed),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PinButton(Icons.clear, onPressed: _onKeyPressed),
                    PinButton('0', onPressed: _onKeyPressed),
                    PinButton(Icons.backspace, onPressed: _onKeyPressed),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PinButton extends StatelessWidget {
  final dynamic text;
  final Function(dynamic) onPressed;

  PinButton(this.text, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Check if the button is either clear or backspace
    bool isClearOrBackspace = (text == Icons.clear || text == Icons.backspace);

    // Define the display text for the number 1 button
    dynamic displayText = (text is dynamic) ? text : '';

    // Adjust displayText if it's '1'
    if (text == '1') {
      displayText = '1\none';
    }
    if (text == '2') {
      displayText = '2\ntwo';
    }
    if (text == '3') {
      displayText = '3\nthree';
    }
    if (text == '4') {
      displayText = '4\nfour';
    }
    if (text == '5') {
      displayText = '5\nfive';
    }
    if (text == '6') {
      displayText = '6\nsix';
    }
    if (text == '7') {
      displayText = '7\nseven';
    }
    if (text == '8') {
      displayText = '8\neight';
    }
    if (text == '9') {
      displayText = '9\nnine';
    }
    if (text == '0') {
      displayText = '0\nzero';
    }
    if (text == Icons.backspace) {
      displayText = Icons.backspace;
    }
    if (text == Icons.clear) {
      displayText = Icons.clear;
    }
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: isClearOrBackspace ? const Color.fromARGB(0, 0, 0, 0) : const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(0.0),
        border: isClearOrBackspace ? null : Border.all(
          color: const Color.fromARGB(255, 176, 176, 176),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onPressed(text),
          borderRadius: BorderRadius.circular(10.0),
          child: Center(
            child: displayText is String
                ? Text(
              displayText,
              textAlign: TextAlign.center, // Align text in the center
              style: TextStyle(fontSize: 18.0),
            )
                : Icon(
              text,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
