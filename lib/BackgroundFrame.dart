import 'package:flutter/material.dart';
import 'StyleUtils.dart';

class BackgroundFrame extends StatelessWidget {
  BackgroundFrame({Key key, this.child}) : assert(child != null), super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
        ),
        Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Text(
                '#YoEstuveAhí',
                style: titleTextStyle
              ),
            )
        ),
        Container(
          height: double.infinity,
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: child
          )
        )
      ],
    );
  }
}
