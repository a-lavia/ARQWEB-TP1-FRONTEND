import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Client.dart';
import 'RegisterScreen.dart';
import 'StyleUtils.dart';
import 'UserScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userTextController = new TextEditingController();

  Widget _buildUserTextField() {
    return textField(
        name: 'Usuario',
        hint: 'Ingresa tu usuario',
        keyboardType: TextInputType.emailAddress,
        icon: Icons.account_circle,
        controller: _userTextController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo usuario vacío';
          }
          return null;
        });
  }

  Widget _buildPasswordTextField() {
    return textField(
        name: 'Contraseña',
        hint: 'Ingresa tu contraseña',
        icon: Icons.lock,
        obscureText: true,
        validator: (value) {
          if (value.isEmpty) {
            return 'Campo password vacío';
          }
          return null;
        });
  }

  Widget _buildLoginBtn() {
    return button(
      text:'INGRESA',
      onPressed: () {
        if (_formKey.currentState.validate()) {
          Client.getInstance().setAuthorization(_userTextController.text, "");
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen()));
        }
      }
    );
  }

  Widget _buildRegisterBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterScreen()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '¿No tenés cuenta? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Registrate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
                    Text('Login', style: subtitleTextStyle),
                    SizedBox(height: 30.0),
                    _buildUserTextField(),
                    SizedBox(height: 30.0),
                    _buildPasswordTextField(),
                    _buildLoginBtn(),
                    _buildRegisterBtn(),
                  ],
                ))));
  }
}
