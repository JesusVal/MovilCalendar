import 'package:flutter/material.dart';
import 'package:moviles_proyecto_v1/Bloc/Login/form_provider.dart';
import 'package:moviles_proyecto_v1/Views/Authorizations/LogIn/LoginView.dart';
import 'package:moviles_proyecto_v1/Views/Authorizations/SingIn/SingInView.dart';
import 'package:moviles_proyecto_v1/Views/Authorizations/forgotParsswordView.dart';
import 'package:moviles_proyecto_v1/Views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormProvider(
      child: MaterialApp(
        title: 'Calendar.io',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        onGenerateRoute: onGenerateRoute,
        //home: LoginView(),
      ),
    );
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == '/login') {
      return MaterialPageRoute(builder: (_) => LoginView());
    }
    if (routeSettings.name == '/forgot_password') {
      return MaterialPageRoute(builder: (_) => ForgotPassView());
      // return null;
    }
    if (routeSettings.name == '/sign_in') {
      return MaterialPageRoute(builder: (_) => SingInView());
      // return null;
    }
    return MaterialPageRoute(builder: (_) => Home());
  }
}
