import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/appconfigprovider.dart';
import '../providers/mytheme.dart';

class Sebha extends StatefulWidget {
  @override
  _SebhaPageState createState() => _SebhaPageState();
}

class _SebhaPageState extends State<Sebha> {
  int _counter = 0;
  double _angle = 0;
  String _buttonText = 'سبحان الله';

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 33 == 0) {
        if (_buttonText == 'سبحان الله') {
          _buttonText = 'الحمد لله';
        } else if (_buttonText == 'الحمد لله') {
          _buttonText = 'الله اكبر';
        } else {
          _buttonText = 'سبحان الله';
        }
        _counter = 0; // Reset counter to 0 after 33 clicks
      }
    });
  }

  void _rotateImage() {
    setState(() {
      _angle += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 250),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _counter++;
                      });
                    },
                    child: Image.asset(
                      'assets/images/head_sebha_logo.png',
                      width: 200, // Adjust width as needed
                      height: 200, // Adjust height as needed
                    ),
                  ),
                ),
                Positioned.fill(
                  child: GestureDetector(
                    onTap: _rotateImage,
                    child: TweenAnimationBuilder(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      tween: Tween<double>(begin: 0, end: _angle),
                      builder: (_, double angle, __) {
                        return Transform.rotate(
                          angle: angle * 0.01,
                          child: Image.asset(
                            'assets/images/body_sebha_logo.png',
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'عدد التسبيحات',
              style: provider.appTheme == ThemeMode.dark
                  ? MyTheme.darkmode.textTheme.titleLarge
                  : MyTheme.lightmode.textTheme.titleLarge,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.yellowcolor
                    : MyTheme.primarycolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$_counter',
                style: provider.appTheme == ThemeMode.dark
                    ? MyTheme.darkmode.textTheme.titleMedium?.copyWith(color: Colors.white)
                    : MyTheme.lightmode.textTheme.titleMedium?.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text(
                _buttonText,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), // Set color to black
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: provider.appTheme == ThemeMode.dark
                    ? MyTheme.yellowcolor
                    : MyTheme.primarycolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
