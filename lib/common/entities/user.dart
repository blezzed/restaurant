
import 'package:restaurant/common/entities/entities.dart';

class UserData {
  int? id;
  String? name;
  String? surname;
  String? email;
  String? phone;
  Location? location;
  String? avatar;

  UserData({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.location,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "surname": surname,
      "email": email,
      "phone": phone,
      "location": (location==null)? null :location!.toJson(),
      "avatar": avatar,
    };
  }

  factory UserData.fromJson(Map<String, dynamic> json) =>
      UserData(
        id: json['id'],
        name: json['name'],
        surname: json['surname'],
        email: json['email'],
        phone: json['phone'],
        location: (json['location']==null)? null :Location.fromJson(json['location']),
        avatar: json['avatar'],
      );

}


