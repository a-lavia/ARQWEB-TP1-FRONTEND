import 'package:flutter/material.dart';
import 'package:swagger/api.dart';

import 'StyleUtils.dart';

class ErrorScreen extends StatelessWidget {
  final ApiException apiException;

  ErrorScreen({Key key, @required this.apiException}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('ERROR!', style: subtitleTextStyle),
                SizedBox(height: 30.0),
                //TODO: Mostrar mensaje personalizado por cada error
                Text(apiException.message, style: subtitleTextStyle),
                backButton(context)
              ],
    )));
  }
}
