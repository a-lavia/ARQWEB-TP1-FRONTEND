import 'package:flutter/material.dart';
import 'BackgroundFrame.dart';
import 'StyleUtils.dart';
import 'package:barcode_scan/barcode_scan.dart';

class CheckIn extends StatefulWidget {
  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
   ScanResult _scanResult;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: BackgroundFrame(
        child:_scanResult==null?Text('Esperando datos de código'):Column(
          children: [
            Text('Contenido: ${_scanResult.rawContent}'),
            Text('Formato: ${_scanResult.format.toString()}'),
            _buildBackBtn()
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _scanCode();
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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


  Future<void> _scanCode() async {
    var result = await BarcodeScanner.scan();
    setState(() {
      _scanResult = result;
    });
  }

}