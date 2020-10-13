import 'package:flutter/material.dart';
import 'package:yoestuveahi/MapWidget.dart';
import 'BackgroundFrame.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.pop(context);
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'ACEPTAR',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: ListView(
              children: <Widget>[
                Text('Elige tu ubicación', style: subtitleTextStyle),
                SizedBox(height: 30.0),
                _buildMap(),
                _buildAcceptBtn()
      ],
    )));
  }
}
