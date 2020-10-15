import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'StyleUtils.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  Widget _buildUserTextField() {
    return textField(
        name: 'Usuario',
        hint: 'Ingresa tu usuario',
        keyboardType: TextInputType.name,
        icon: Icons.account_circle,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo usuario vacío';
          }
          return null;
        });
  }

  Widget _buildEmailTextField() {
    return textField(
        name: 'Email',
        hint: 'Ingresa tu email',
        keyboardType: TextInputType.emailAddress,
        icon: Icons.email,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo email vacío';
          }
          return null;
        });
  }

  Widget _buildPasswordTextField() {
    return textField(
        name: 'Contraseña',
        hint: 'Ingresa tu contraseña',
        obscureText: true,
        icon: Icons.lock,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo contraseña vacío';
          }
          return null;
        });
  }

  Widget _buildRegisterBtn() {
    return button(
        text: 'REGISTRAR',
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // Process data.
          }
        });
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
                    Text('Registro', style: subtitleTextStyle),
                    SizedBox(height: 30.0),
                    _buildUserTextField(),
                    SizedBox(height: 30.0),
                    _buildEmailTextField(),
                    SizedBox(height: 30.0),
                    _buildPasswordTextField(),
                    SizedBox(height: 30.0),
                    _buildRegisterBtn(),
                    backButton(context)
                  ],
                ))));
  }
}
