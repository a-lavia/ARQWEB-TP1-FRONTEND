import 'package:flutter/material.dart';
import 'BackgroundFrame.dart';
import 'LocationQRScreen.dart';
import 'StyleUtils.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nombre',
          style: textFieldLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: textFieldBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value.isEmpty) {
                return 'Campo nombre vacío';
              }
              return null;
            },
            style: textFieldTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.map,
                color: Colors.white,
              ),
              hintText: 'Ingresa un nombre',
              hintStyle: textFieldHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCapacityTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Capacidad',
          style: textFieldLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: textFieldBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return 'Campo capacidad vacío';
              }
              return null;
            },
            style: textFieldTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              hintText: 'Ingresa la capacidad',
              hintStyle: textFieldHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LocationQrScreen()));  //Esta linea debe ir desp de la validacion de los datos esta aca ahora para poder continuar
          if (_formKey.currentState.validate()) {
            // Process data.
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'CREAR',
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
                    Text('Locación', style: subtitleTextStyle),
                    SizedBox(height: 30.0),
                    _buildNameTextField(),
                    SizedBox(height: 30.0),
                    _buildCapacityTextField(),
                    _buildCreateBtn(),
                    _buildBackBtn(),
                  ],
                )
            )
        )
    );
  }
}
