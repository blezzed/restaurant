

import 'package:restaurant/common/entities/entities.dart';

class UserData {
  String? id;
  String? access_token;
  String? name;
  String? email;
  String? phone;
  LocationModel? location;
  String? avatar;
  String? description;
  int? type;
  String? created_at;

  UserData({
    this.id,
    this.access_token,
    this.name,
    this.email,
    this.phone,
    this.location,
    this.avatar,
    this.description,
    this.type,
    this.created_at,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "access_token": access_token,
      "name": name,
      "email": email,
      "phone": phone,
      "location": (location==null)? null :location!.toJson(),
      "avatar": avatar,
      "description": description,
      "type": type,
      "created_at": created_at,
    };
  }

  factory UserData.fromJson(Map<String, dynamic> json) =>
      UserData(
        id: json['id'],
        access_token: json['access_token'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        location: (json['location']==null)? null :LocationModel.fromJson(json['location']),
        avatar: json['avatar'],
        description: json['description'],
        type: json['type'],
        created_at: json['created_at'],
      );

  /*factory UserData.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return UserData(
      id: data?['id'],
      access_token: data?['access_token'],
      name: data?['name'],
      email: data?['email'],
      phone: data?['phone'],
      location: (data?['location']==null)? null :LocationModel.fromJson(data?['location']),
      avatar: data?['avatar'],
      description: data?['description'],
      type: data?['type'],
      created_at: data?['created_at'],
    );
  }*/
}


