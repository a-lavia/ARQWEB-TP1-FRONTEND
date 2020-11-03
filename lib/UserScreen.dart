import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import 'package:yoestuveahi/LocationInfoScreen.dart';
import 'package:yoestuveahi/QRScannerScreen.dart';
import 'Client.dart';
import 'ErrorScreen.dart';
import 'RegisterLocationScreen.dart';
import 'StyleUtils.dart';

class UserScreen extends StatefulWidget {
  final User user;

  UserScreen({Key key, @required this.user}) : super(key: key);
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  void _refresh() async {
    User user;
    try {
      user = await Client.getInstance().userApi.getUser();
    } catch (e) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorScreen(apiException: e)));
      print("Error: $e\n");
    }
    setState(() {
        widget.user.isCheckedIn = user.isCheckedIn;
        widget.user.possiblyInfected = user.possiblyInfected;
        widget.user.isInfected = user.isInfected;
    });
  }

  void _doCheckIn() async {
    String locationId = await Navigator.push(context, MaterialPageRoute(builder: (context) => QRScannerScreen()));
    if (locationId != null) {
      try {
        await Client
            .getInstance()
            .checkApi
            .userCheckinLocationIdPost(locationId);
        _refresh();
      } catch (e) {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ErrorScreen(apiException: e)));
        print("Error: $e\n");
      }
    }
  }

  void _checkInOnPressed() {
    if (widget.user.possiblyInfected) {
      showAlertDialogOptions(context,
          msg: 'Usted podría estar infectado, ¿seguro que desea continuar?',
          acceptAction: () {
            _doCheckIn();
          }
      );
    } else {
      _doCheckIn();
    }
  }

  Widget _buildCheckInBtn() {
    return button(
        text: 'CHECK IN',
        onPressed: widget.user.isInfected ? null : _checkInOnPressed
    );
  }

  void _doCheckout() async {
    try {
      await Client.getInstance().checkApi.userCheckoutPost();
      _refresh();
    } catch (e) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorScreen(apiException: e)));
      print("Error: $e\n");
    }
  }

  Widget _buildCheckOutBtn() {
    return button(
      text: 'CHECK OUT',
      onPressed: () {
        _doCheckout();
      }
    );
  }

  void _showCalendar() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2001),
        lastDate: DateTime(2021)
    );
  }

  Widget _buildReportPositiveBtn() {
    return button(
        text: 'REPORTAR TEST POSITIVO',
        onPressed: _showCalendar
    );
  }

  Widget _buildReportCuredBtn() {
    return button(
        text: 'REPORTAR ALTA MÉDICA',
        onPressed: _showCalendar
    );
  }

  Widget _buildReportNegativeBtn() {
    return button(
        text: 'REPORTAR TEST NEGATIVO',
        onPressed: _showCalendar//TODO: Importa la fecha?
    );
  }

  void _locationInfoOnPressed() async {
    String locationId = await Navigator.push(context, MaterialPageRoute(builder: (context) => QRScannerScreen()));
    if (locationId != null) {
      try {
        Location location = await Client.getInstance().locationApi.locationLocationIdGet(locationId);
        Navigator.push(context, MaterialPageRoute(builder: (context) => LocationInfoScreen(location: location)));
      } catch (e) {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ErrorScreen(apiException: e)));
        print("Error: $e\n");
      }
    }
  }

  Widget _buildLocationInfoBtn() {
    return button(
      text: 'VER LOCACIÓN',
      onPressed: () {
        _locationInfoOnPressed();
      }
    );
  }

  Widget _buildRegisterLocationBtn() {
    return button(
        text: 'CREAR LOCACIÓN',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterLocationScreen()));
        });
  }

  Widget _buildExitBtn() {
    return backButton(context, text: 'SALIR');
  }

  Widget _buildMenu() {
    List<Widget> widgets = <Widget>[];
    widgets.add(Text('Bienvenido ${widget.user.email}', style: subtitleTextStyle));
    if (!widget.user.isCheckedIn) {
      widgets.add(_buildCheckInBtn());
    } else {
      widgets.add(_buildCheckOutBtn());
    }
    if (widget.user.isInfected) {
      widgets.add(_buildReportCuredBtn());
    } else {
      widgets.add(_buildReportPositiveBtn());
        if (widget.user.possiblyInfected) {
          widgets.add(_buildReportNegativeBtn());
        }
    }
    widgets.add(_buildLocationInfoBtn());
    widgets.add(_buildRegisterLocationBtn());
    widgets.add(_buildExitBtn());
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: widgets);
  }

  Widget _buildHealthStatusBtn() {
    if (widget.user.isInfected) {
      return FloatingActionButton.extended(
        label: Text('¡ESTÁS INFECTADO! INFORMA TU ESTADO DE SALUD'),
        icon: Icon(Icons.add_box),
        backgroundColor: Colors.pink,
      );
    } else if (widget.user.possiblyInfected) {
      return FloatingActionButton.extended(
        label: Text('¡TENÉS RIESGO DE CONTAGIO! INFORMA TU ESTADO DE SALUD.'),
        icon: Icon(Icons.add_box),
        backgroundColor: Colors.pink,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    //DEBUG
    widget.user.possiblyInfected = true;
    widget.user.isInfected = false;
    return Scaffold(
      body: BackgroundFrame(
          child: _buildMenu(),
      ),
      floatingActionButton: _buildHealthStatusBtn()
    );
  }
}
