import 'package:flutter/material.dart';
import 'LocationQRScreen.dart';
import 'PickLocationScreen.dart';
import 'StyleUtils.dart';

class RegisterLocationScreen extends StatefulWidget {
  @override
  _RegisterLocationScreenState createState() => _RegisterLocationScreenState();
}

class _RegisterLocationScreenState extends State<RegisterLocationScreen> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildNameTextField() {
    return textField(
        name: 'Nombre',
        hint: 'Ingresa un nombre',
        icon: Icons.map,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo nombre vacío';
          }
          return null;
        });
  }

  Widget _buildCapacityTextField() {
    return textField(
        name: 'Capacidad',
        hint: 'Ingresa la capacidad',
        keyboardType: TextInputType.number,
        icon: Icons.home,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo capacidad vacío';
          }
          return null;
        });
  }

  Widget _buildPickLocationBtn() {
    return button(
        text: 'ELEGIR UBICACIÓN',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PickLocationScreen()));
        });
  }

  Widget _buildCreateBtn() {
    return button(
        text: 'CREAR',
        onPressed: () {
          //TODO: Vincular al backend
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LocationQrScreen()));
          if (_formKey.currentState.validate()) {
            // Process data.
          }
        });
  }

  Widget _buildBackBtn() {
    return backButton(context);
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
                    _buildPickLocationBtn(),
                    _buildCreateBtn(),
                    _buildBackBtn(),
                  ],
                ))));
  }
}
