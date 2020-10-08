class Locacion {
  final String name;
  final int capacidad;
  final int infectados;

  const Locacion({
    this.name,
    this.capacidad,
    this.infectados
  });
}

final locaciones = [
  new Locacion(name:'TU VIEJA',capacidad: 1,infectados:1),
  new Locacion(name:'TU HERMANA',capacidad: 1,infectados:1),
  new Locacion(name:'GOL SACANDO DEL MEDIO',capacidad: 1,infectados:1),
  new Locacion(name:'TU VIEJA 2',capacidad: 1,infectados:1),
  new Locacion(name:'TU HERMANA 2',capacidad: 1,infectados:1),
  new Locacion(name:'TU VIEJA 3',capacidad: 1,infectados:1),
];