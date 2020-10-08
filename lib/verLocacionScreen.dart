import 'package:flutter/material.dart';
import 'LocationScreen.dart';
import 'BackgroundFrame.dart';
import 'StyleUtils.dart';
import 'UserScreen.dart';
import 'LocationClass.dart';

class VerLocationsScreen extends StatefulWidget {
  @override
  _VerLocationsScreenState createState() => _VerLocationsScreenState();
}

class _VerLocationsScreenState extends State<VerLocationsScreen> {
  // This widget is the root of your application.
  @override
  Widget _buildList(BuildContext context) {
    return new ListView(
              children: locaciones.map(_buildItem).toList(),
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

    Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Locaciones:', style: subtitleTextStyle),
                    SizedBox(height: 30.0),
                    _buildList(context),
                    _buildBackBtn(),
                  ],
                )
            )
        )
    );
  }
}

Widget _buildItem(Locacion locacion) {
  return new ListTile(
      title: new Text(locacion.name),
      subtitle: new Text('Capacidad Actual: ${locacion.capacidad}'' Infectados Actualmente: ${locacion.infectados}'),
      leading: new Icon(Icons.map),
      onTap: (){
        print(locacion.name);
      },
  );
}

