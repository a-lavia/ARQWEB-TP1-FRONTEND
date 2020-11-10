import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import 'Client.dart';
import 'StyleUtils.dart';

class LocationInfoScreen extends StatelessWidget {
  final Location location;

  LocationInfoScreen({Key key, @required this.location}) : super(key: key);

  Widget _buildLocationInfo(BuildContext context) {
    List<Widget> widgets = <Widget>[];

    widgets.add(Text(location.name, style: subtitleTextStyle));
    widgets.add(SizedBox(height: 30.0));
    widgets.add(Text("Descripción: ${location.description}", style: subSubtitleTextStyle));
    widgets.add(Text("Dirección: ${location.address}", style: subSubtitleTextStyle));
    widgets.add(Text("Ocupación: ${location.occupation}/${location.maxCapacity}", style: subSubtitleTextStyle));

    if (location.images.isNotEmpty) {
      widgets.add(SizedBox(height: 30.0));
    }

    var imagenes = List<Image>();
    for (var img in location.images) {
      imagenes.add(Image.network(Client.getInstance().getBasePath() + img));
    }
    var imgGrid = GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      children: imagenes,
      shrinkWrap: true,
    );

    if (location.images.isNotEmpty) {
      widgets.add(imgGrid);
    }

    widgets.add(backButton(context));

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundFrame(
            child: _buildLocationInfo(context)
      )
    );
  }
}
