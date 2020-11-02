import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import 'StyleUtils.dart';

class ErrorScreen extends StatelessWidget {
  final ApiException apiException;

  ErrorScreen({Key key, @required this.apiException}) : super(key: key);

  Text _mensajeSegunError(error) {
    var mensaje;
    switch (error.code) {
      case 403:
        mensaje = "Usuario o contraseña incorrectos";
        break;
      default:
        mensaje = error.message;
        break;
    }
    return Text(mensaje, style: subtitleTextStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('ERROR!', style: subtitleTextStyle),
        SizedBox(height: 30.0),
        _mensajeSegunError(apiException),
        backButton(context)
      ],
    )));
  }
}
