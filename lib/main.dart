import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'APP YEA',
    home: pantallaInicio(),
  ));
}

class pantallaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP YEA - SEAMOS RESPONSABLES! CUIDEMONOS ENTRE TODOS!'),
      ),
      body: Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text(
                      "SING UP",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => singUpHome()),
            );}),
                new RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text(
                      "SING IN",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => LOG(),
                  ));
                    }),
              ],
            ),
          ],
        ),
      )
    );
  }
}

class singUpHome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP YEA - Registrese para Continuar"),
      ),
      body: Center(
        child:new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text(
                      "USUARIO GENERAL",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddUserGen()),
            );}),
                new RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text(
                      "LOCACION",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddLocacionHome()),
            );}),
              ],
            ),
          ],
        )
        ),
    );
  }
}


class LOG extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP YEA - Inicie Sesión por favor"),
      ),
      body: Center(
                child: Login()
            )
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Usuario',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Texto usuario vacío';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Texto password vacío';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class AddUserGen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP YEA - Crear usuario para continuar"),
      ),
      body: Center(
                child: AddUserGral()
            )
    );
  }
}

class AddUserGral extends StatefulWidget {
  AddUserGral({Key key}) : super(key: key);

  @override
  _AddUserGralState createState() => _AddUserGralState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AddUserGralState extends State<AddUserGral> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Usuario',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Texto usuario vacío';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Texto password vacío';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class AddLocacionHome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP YEA - Registre su locación"),
      ),
      body: Center(
                child: AddLocacion()
            )
    );
  }
}

class AddLocacion extends StatefulWidget {
  AddLocacion({Key key}) : super(key: key);

  @override
  _AddLocacionState createState() => _AddLocacionState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AddLocacionState extends State<AddLocacion> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nombre',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Texto Nombre vacío';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Texto password vacío';
              }
              return null;
            },
          ),
           TextFormField(
            decoration: const InputDecoration(
              hintText: 'Capacidad',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Texto Capacidad vacío';
              }
              return null;
            },
          ), TextFormField(
            decoration: const InputDecoration(
              hintText: 'Geoposicion',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Texto Geoposicion vacío';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}



