import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import 'StyleUtils.dart';

class LocationInfoScreen extends StatelessWidget {
  final Location location;

  LocationInfoScreen({Key key, @required this.location}) : super(key: key);

  List<Widget> _children(Location location, context) {
    var body = <Widget>[
      Text(location.description, style: subtitleTextStyle),
      SizedBox(height: 30.0),
      Text(
        "Dirección: ${location.address}",
        style: subSubtitleTextStyle,
      ),
      Text(
        "Ocupación actual: ${location.occupation}",
        style: subSubtitleTextStyle,
      ),
      Text(
        "Capacidad máxima: ${location.maxCapacity}",
        style: subSubtitleTextStyle,
      ),
    ];

    if (location.images.isNotEmpty) {
      body.add(SizedBox(height: 30.0));
    }

    var imagenes = List<Image>();
    for (var img in location.images) {
      imagenes.add(Image.network(img));
    }
    var imgGrid = GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      children: imagenes,
      shrinkWrap: true,
    );

    if (location.images.isNotEmpty) {
      body.add(imgGrid);
    }

    body.add(SizedBox(height: 30.0));
    body.add(backButton(context));

    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _children(location, context))));
  }
}
