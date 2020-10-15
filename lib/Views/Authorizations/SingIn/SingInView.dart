import 'package:flutter/material.dart';
import 'package:moviles_proyecto_v1/Bloc/Login/form_bloc.dart';
import 'package:moviles_proyecto_v1/Bloc/Login/form_provider.dart';
import 'package:moviles_proyecto_v1/Views/Authorizations/Components/Fields.dart';

class SingInView extends StatelessWidget {
  const SingInView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormBloc formBloc = FormProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn'),
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
                buttonSignIn(formBloc, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
