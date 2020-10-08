import 'package:flutter/material.dart';
import 'BackgroundFrame.dart';
import 'RegisterScreen.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'StyleUtils.dart';

class LocationQrScreen extends StatefulWidget {
  @override
  _LocationQrScreenState createState() => _LocationQrScreenState();
}

class _LocationQrScreenState extends State<LocationQrScreen> {
  final _formKey = GlobalKey<FormState>();
  final String data = "12345680"; // ESTE DATA TIENE Q SER EL ID CUANDO RECIBIMOS DEL BACK!


   Widget _qr(BuildContext context) {
    return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 16,),
            QrImage(
              data: data,
              gapless: true,
              size: 250,
              errorCorrectionLevel: QrErrorCorrectLevel.H,
              backgroundColor: Colors.white,
            )
          ],
        ),
      );
  }

   Widget _buildBackBtn() {
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
          'VOLVER',
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
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('QR para Locacion', style: subtitleTextStyle),
                    SizedBox(height: 30.0),
                    _qr(context),
                    _buildBackBtn(),
                  ],
                )
            )
        )
    );
  }
}
