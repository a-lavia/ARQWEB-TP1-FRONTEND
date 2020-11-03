import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import 'StyleUtils.dart';

class LocationInfoScreen extends StatelessWidget {
  final Location location;

  LocationInfoScreen({Key key, @required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //FIXME: Location no tiene atributo name y devuelve muchos campos en null
                Text(location.description, style: subtitleTextStyle),
                SizedBox(height: 30.0),
                backButton(context)
              ],
            )));
  }
}
