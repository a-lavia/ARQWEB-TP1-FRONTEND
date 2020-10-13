class Location {
  final String name;
  final int capacidad;
  final int infectados;

  const Location({
    this.name,
    this.capacidad,
    this.infectados
  });
}

final testLocations = [
  new Location(name:'TU VIEJA',capacidad: 1,infectados:1),
  new Location(name:'TU HERMANA',capacidad: 1,infectados:1),
  new Location(name:'GOL SACANDO DEL MEDIO',capacidad: 1,infectados:1),
  new Location(name:'TU VIEJA 2',capacidad: 1,infectados:1),
  new Location(name:'TU HERMANA 2',capacidad: 1,infectados:1),
  new Location(name:'TU VIEJA 3',capacidad: 1,infectados:1),
];