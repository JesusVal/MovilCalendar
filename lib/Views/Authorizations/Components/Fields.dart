import 'package:flutter/material.dart';
import 'package:moviles_proyecto_v1/Bloc/Login/form_bloc.dart';

Widget emailField(FormBloc formBloc) {
  return StreamBuilder<String>(
    stream: formBloc.email,
    builder: (context, AsyncSnapshot<String> snapshot) {
      return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'ex@ample.com',
          labelText: 'Email',
          errorText: snapshot.error,
        ),
        onChanged: formBloc.changeEmail,
      );
    },
  );
}

Widget passwordField(FormBloc formBloc) {
  return StreamBuilder<String>(
    stream: formBloc.password,
    builder: (context, AsyncSnapshot<String> snapshot) {
      return TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        maxLength: 20,
        decoration: InputDecoration(
          hintText: 'password',
          labelText: 'Password',
          errorText: snapshot.error,
        ),
        onChanged: formBloc.changePassword,
      );
    },
  );
}

Widget buttonLogIn(FormBloc formBloc, BuildContext context) {
  return StreamBuilder<bool>(
    stream: formBloc.submitValidForm,
    builder: (context, AsyncSnapshot<bool> snapshot) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: RaisedButton(
          onPressed: snapshot.hasError
              ? null
              : () {
                  if (formBloc.submit()) {
                    print("passed");
                    Navigator.pushNamed(context, '/calendar');
                  }
                },
          child: const Icon(Icons.arrow_forward),
          color: Colors.teal,
          clipBehavior: Clip.hardEdge,
          elevation: 10,
          disabledColor: Colors.blueGrey,
          disabledElevation: 10,
          disabledTextColor: Colors.white,
        ),
      );
    },
  );
}

Widget optionsLogIn(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/forgot_password'),
        child: Container(
          child: Text('Forgot password?'),
          alignment: Alignment.bottomLeft,
        ),
      ),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/sign_in'),
        child: Container(
          child: Text('Sign up'),
          alignment: Alignment.bottomLeft,
        ),
      ),
    ],
  );
}

Widget optionsSignIn(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/login'),
        child: Container(
          child: Text('Already have already an account?'),
          alignment: Alignment.bottomLeft,
        ),
      ),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/sign_in'),
        child: Container(
          child: Text('Sign up'),
          alignment: Alignment.bottomLeft,
        ),
      ),
    ],
  );
}

Widget buttonSignIn(FormBloc formBloc, BuildContext context) {
  return StreamBuilder<bool>(
    stream: formBloc.submitValidForm,
    builder: (context, AsyncSnapshot<bool> snapshot) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: RaisedButton(
          onPressed: snapshot.hasError
              ? null
              : () {
                  formBloc.createUser();
                  Navigator.pushNamed(context, '/home');
                },
          child: const Icon(Icons.arrow_forward),
          color: Colors.teal,
          clipBehavior: Clip.hardEdge,
          elevation: 10,
          disabledColor: Colors.blueGrey,
          disabledElevation: 10,
          disabledTextColor: Colors.white,
        ),
      );
    },
  );
}

Widget testWidget() {
  return Text("datasss");
}
