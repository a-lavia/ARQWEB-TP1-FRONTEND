part of swagger.api;

class LocationList {
  
  LocationList();

  @override
  String toString() {
    return 'LocationList[]';
  }

  LocationList.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
  }

  Map<String, dynamic> toJson() {
    return {
     };
  }

  static List<LocationList> listFromJson(List<dynamic> json) {
    return json == null ? new List<LocationList>() : json.map((value) => new LocationList.fromJson(value)).toList();
  }

  static Map<String, LocationList> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, LocationList>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new LocationList.fromJson(value));
    }
    return map;
  }
}
