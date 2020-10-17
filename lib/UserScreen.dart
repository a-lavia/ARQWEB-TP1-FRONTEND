import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import 'Client.dart';
import 'RegisterLocationScreen.dart';
import 'StyleUtils.dart';
import 'CheckInScreen.dart';
import 'HealthStatusScreen.dart';
import 'CheckOutScreen.dart';

class UserScreen extends StatefulWidget {
  final User user;

  UserScreen({Key key, @required this.user}) : super(key: key);
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  Widget _buildRegisterLocationBtn() {
    return button(
        text: 'CREAR LOCACIÓN',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterLocationScreen()));
        });
  }

  Widget _buildCheckInBtn() {
    return button(
        text: 'CHECK IN',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CheckInScreen()));
        });
  }

  Widget _buildCheckOutBtn() {
    return button(
      text: 'CHECK OUT',
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CheckOutScreen()));
      },
    );
  }

  Widget _buildInformBtn() {
    return button(
        text: 'INFORMAR',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HealthStatusScreen()));
        });
  }

  //TODO: COMPLETAR...
  Widget _buildVerLocacionBtn() {
    return button(
      text: 'VER LOCACIÓN',
    );
  }

  Widget _buildExitBtn() {
    return backButton(context, text: 'SALIR');
  }

  Widget _buildMenu(User user) {
    List<Widget> widgets = <Widget>[];
    widgets.add(Text('Bienvenido ${user.email}', style: subtitleTextStyle));
    widgets.add(_buildRegisterLocationBtn());
    if (!user.isCheckedIn) {
      widgets.add(_buildCheckInBtn());
    } else {
      widgets.add(_buildCheckOutBtn());
    }
    widgets.add(_buildInformBtn());
    widgets.add(_buildVerLocacionBtn());
    widgets.add(_buildExitBtn());
    return Column(
        mainAxisAlignment: MainAxisAlignment.center, children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundFrame(
          child: _buildMenu(widget.user)
      )
    );
  }
}
