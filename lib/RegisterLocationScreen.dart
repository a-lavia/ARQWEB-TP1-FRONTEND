import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:swagger/api.dart';
import 'Client.dart';
import 'LocationQRScreen.dart';
import 'PickLocationScreen.dart';
import 'StyleUtils.dart';

class RegisterLocationScreen extends StatefulWidget {
  @override
  _RegisterLocationScreenState createState() => _RegisterLocationScreenState();
}

class _RegisterLocationScreenState extends State<RegisterLocationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _capacityTextController = TextEditingController();
  LatLng _position;

  Widget _buildNameTextField() {
    return textField(
        name: 'Nombre',
        hint: 'Ingresa un nombre',
        icon: Icons.map,
        controller: _nameTextController,
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
        controller: _capacityTextController,
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
        onPressed: () async {
          _position = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => PickLocationScreen()));
        });
  }

  Widget _buildCreateBtn() {
    return button(
        text: 'CREAR',
        onPressed: () {
          if (_formKey.currentState.validate()) {
            if (_position == null) {
              showAlertDialog(context, msg: 'Elija una ubicación por favor.');
            } else {
              //TODO: Completar todos los campos
              NewLocation newLocation = NewLocation();
              newLocation.name = _nameTextController.text;
              newLocation.maxCapacity = double.parse(_capacityTextController.text);
              newLocation.latitude = _position.latitude.toString();
              newLocation.longitude = _position.longitude.toString();

              try {
                Client.getInstance().locationApi.locationPost(newLocation);
              } catch (e) {
                //TODO: Mostrar algún mensaje de error en pantalla
                print("Error: $e\n");
              }

              //Navigator.push(context,
                  //MaterialPageRoute(builder: (context) => LocationQrScreen()));
            }
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
