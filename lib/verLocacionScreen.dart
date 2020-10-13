import 'package:flutter/material.dart';
import 'BackgroundFrame.dart';
import 'StyleUtils.dart';
import 'UserScreen.dart';
import 'LocationClass.dart';

class VerLocationsScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Países',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: new ListView(
              children: locaciones.map(_buildItem).toList(),
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