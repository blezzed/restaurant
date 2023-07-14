
class Location{
  late int? _id;
  late String? _street;
  late String? _country;
  late String _address;
  late String _latitude;
  late String _longitude;

  Location({
    id,
    required addressType,
    street,
    country,
    address,
    latitude,
    longitude,
  }){
    _id = id;
    _street = street;
    _country = country;
    _latitude = latitude;
    _longitude = longitude;
    _address = address;
  }
  int? get id=>_id;
  String get address=>_address;
  String? get street=>_street;
  String? get country=>_country;
  String get latitude => _latitude;
  String get longitude => _longitude;

  Location.fromJson(Map<String, dynamic> json){
    _id = json["id"];
    _address = json["address"];
    _street = json["street"];
    _country = json["country"];
    _latitude = json["latitude"];
    _longitude = json["longitude"];
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "address":_address,
      "street":_street,
      "country":_country,
      "latitude":_latitude,
      "longitude":_longitude,
    };
  }

  /*factory Location.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Location(
      id : data?["id"],
      addressType :data?["addressType"],
      address :data?["address"],
      street : data?["street"],
      country : data?["country"],
      latitude : data?["latitude"],
      longitude : data?["longitude"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (addressType != null) "addressType": addressType,
      if (address != null) "addressType": address,
      if (street != null) "street": street,
      if (country != null) "country": country,
      if (latitude != null) "latitude": latitude,
      if (longitude != null) "longitude": longitude,
    };
  }*/
}