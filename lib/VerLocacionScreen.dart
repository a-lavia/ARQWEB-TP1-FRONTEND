import 'package:flutter/material.dart';
import 'StyleUtils.dart';
import 'UserScreen.dart';
import 'Location.dart';

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
              children: testLocations.map(_buildItem).toList(),
          )
      )
    );
  }
}

Widget _buildItem(Location locacion) {
  return new ListTile(
      title: new Text(locacion.name),
      subtitle: new Text('Capacidad Actual: ${locacion.capacidad}'' Infectados Actualmente: ${locacion.infectados}'),
      leading: new Icon(Icons.map),
      onTap: (){
        print(locacion.name);
      },
  );
}