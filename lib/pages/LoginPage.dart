import 'dart:io';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:magentorx/pages/HomePage.dart';
import 'package:magentorx/utils/api/AuthToken.dart';
import 'package:magentorx/utils/colour/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  SharedPreferences pref;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Card(
                    shape: CircleBorder(),
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/jomsoft.png',
                        width: 50.0,
                        height: 50.0,
                      ),
                    )),
                SizedBox(height: 16.0),
                Text(
                  'JSHOP',
                  style: Theme.of(context).textTheme.headline,
                ),
              ],
            ),
            SizedBox(height: 120.0),
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            SizedBox(height: 12.0),
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CLEAR'),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                    child: Text('NEXT'),
                    elevation: 8.0,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                    onPressed: () => AuthToken(
                            username: _usernameController.text,
                            password: _passwordController.text)
                        .getAdminToken()
                        .then(_handleLogin)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _handleLogin(Map data) async {
    pref = await _pref;
    if (data["statuscode"] == 200) {
      pref
          .setString("TOKEN", data["response"])
          .whenComplete(() => Navigator.pushReplacementNamed(context, "/app"));
      print("You're good to go");
    } else
      print("How dare you trying to trespass the login");
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(accentColor: color),
    );
  }
}
