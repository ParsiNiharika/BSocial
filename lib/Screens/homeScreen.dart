import 'package:flutter/material.dart';
import 'package:test/Screens/main-screen.dart';
import './loginScreen.dart';


class HomeScreen extends StatelessWidget {
  showLoginScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return LoginScreen();
    }));
  }

  showMainScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MainScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(43, 45, 66, 1),
      child: SafeArea(
          bottom: false,
          child: Stack(children: <Widget>[
            SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  SizedBox(height: 200),
                  Center(
                      child: Text(
                    "BSOCIAL",
                    style: TextStyle(color: Colors.white),
                  )),
                  SizedBox(height: 50),
                  Center(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 250, height: 50),
                      child: ElevatedButton(
                        onPressed: () => showLoginScreen(context),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            'Admin',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.pink),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 250, height: 50),
                      child: ElevatedButton(
                        onPressed: () => showMainScreen(context),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            'Guest',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.pink),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ]))
          ])),
    );
  }
}
