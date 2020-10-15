import 'package:flutter/material.dart';

class Home extends StatelessWidget {
// render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar.io'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 200, left: 50, right: 50),
          height: 500,
          child: Column(
            children: <Widget>[
              _loginButton(context),
              _signInButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return RaisedButton(
      onPressed: () => Navigator.pushNamed(context, '/login'),
      child: Text("Login"),
      color: Colors.teal,
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      disabledColor: Colors.blueGrey,
      disabledElevation: 10,
      disabledTextColor: Colors.white,
    );
  }

  Widget _signInButton(BuildContext context) {
    return RaisedButton(
      onPressed: () => Navigator.pushNamed(context, '/sign_in'),
      child: Text("SignIn"),
      color: Colors.teal,
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      disabledColor: Colors.blueGrey,
      disabledElevation: 10,
      disabledTextColor: Colors.white,
    );
  }
}
