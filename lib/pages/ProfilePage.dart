import 'package:flutter/material.dart';
import 'package:magentorx/utils/pref/helper.dart';

class ProfilePage extends StatefulWidget {


  @override
  State createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0,),
              Card(
              ),
              SizedBox(height: 30.0,),
              Column(
                children: <Widget>[
                  FlatButton(onPressed: () =>
                      Helper.logout(), child: Text("Logout")),
                  Row(
                    children: <Widget>[
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }


}