import 'package:flutter/material.dart';
import 'package:yoestuveahi/MapWidget.dart';
import 'StyleUtils.dart';

class PickLocationScreen extends StatefulWidget {
  @override
  _PickLocationScreenState createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  Widget _buildMap() {
    return Container(width: double.infinity, height: 500, child: MapWidget());
  }

  Widget _buildAcceptBtn() {
    return backButton(context, text: 'ACEPTAR');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Elige tu ubicación', style: subtitleTextStyle),
                SizedBox(height: 30.0),
                _buildMap(),
                _buildAcceptBtn()
      ],
    )));
  }
}
