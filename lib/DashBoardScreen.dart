import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

   Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFF8B81),
        dividerColor: Colors.grey,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return Scaffold(
      body: IconTheme.merge(
        data: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(Icons.create, size: 1.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Datos al dia de: $now' ,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                     ],
                  ),
                  Divider(height: 1.0),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.person,
                      text: 'Usuarios Registrados',
                      onTap: () {showDialog(
          context: context, 
          builder: (context)=> AlertDialog(
            title: Text(''),
            content: Text('Usuarios registrados: '),
            actions: <Widget> [
             FlatButton(
                child: Text('Aceptar'),
                onPressed: (){Navigator.of(context).pop();},
              )
            ],)
            );},
                    ),
                  ),
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.access_alarm,
                      text: 'Potencial Infectados',
                      onTap: () {showDialog(
          context: context, 
          builder: (context)=> AlertDialog(
            title: Text(''),
            content: Text('Personas en riesgo de estar infectados: '),
            actions: <Widget> [
             FlatButton(
                child: Text('Aceptar'),
                onPressed: (){Navigator.of(context).pop();},
              )
            ],)
            );},
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.map_rounded,
                      text: 'Locaciones Registradas',
                      onTap: () {showDialog(
          context: context, 
          builder: (context)=> AlertDialog(
            title: Text(''),
            content: Text('Locaciones registradas: '),
            actions: <Widget> [
             FlatButton(
                child: Text('Aceptar'),
                onPressed: (){Navigator.of(context).pop();},
              )
            ],)
            );},
                    ),
                  ),
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.coronavirus_sharp,
                      text: 'Personas Infectadas',
                      onTap: () {showDialog(
          context: context, 
          builder: (context)=> AlertDialog(
            title: Text(''),
            content: Text('Personas Infectadas: '),
            actions: <Widget> [
             FlatButton(
                child: Text('Aceptar'),
                onPressed: (){Navigator.of(context).pop();},
              )
            ],)
            );},
                    ),
                  ),
                ],
              ),
            ),
           ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  const DashboardButton({
    Key key,
    @required this.icon,
    @required this.text,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.3,
              child: FittedBox(
                child: Icon(icon),
              ),
            ),
            SizedBox(height: 1.0),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 0.8,
            ),
            SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Divider(height: 1.0),
            ),
          ],
        ),
      ),
    );
  }
}