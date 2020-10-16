import 'package:flutter/material.dart';
import 'package:moviles_proyecto_v1/Bloc/Login/form_bloc.dart';
import 'package:moviles_proyecto_v1/Bloc/Login/form_provider.dart';
import 'package:moviles_proyecto_v1/Views/Authorizations/Components/Fields.dart';

class LoginView extends StatefulWidget {
  //LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //final bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final FormBloc formBloc = FormProvider.of(context);
    //final FormBloc formBloc;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 200, left: 50, right: 50),
          height: 500,
          child: Form(
            child: Column(
              children: <Widget>[
                emailField(formBloc),
                passwordField(formBloc),
                buttonLogIn(formBloc, context),
                optionsLogIn(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
