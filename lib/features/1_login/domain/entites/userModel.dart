// // To parse this JSON data, do
// //
// //     final userModel = userModelFromJson(jsonString);

// import 'package:meta/meta.dart';

// class UserModel {
//     UserModel({
//         @required this.data,
//         @required this.token,
//     });

//     final Data data;
//     final String token;

//     factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//         token: json["token"] == null ? null : json["token"],
//     );

// }

// class Data {
//     Data({
//         @required this.id,
//         @required this.name,
//         @required this.email,
//         @required this.phone,
//         @required this.type,
//         @required this.avatar,
//         @required this.localedType,
//         @required this.createdAt,
//         @required this.createdAtFormated,
//     });

//     final int id;
//     final String name;
//     final String email;
//     final String phone;
//     final String type;
//     final String avatar;
//     final String localedType;
//     final DateTime createdAt;
//     final String createdAtFormated;

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//         email: json["email"] == null ? null : json["email"],
//         phone: json["phone"] == null ? null : json["phone"],
//         type: json["type"] == null ? null : json["type"],
//         avatar: json["avatar"] == null ? null : json["avatar"],
//         localedType: json["localed_type"] == null ? null : json["localed_type"],
//         createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//         createdAtFormated: json["created_at_formated"] == null ? null : json["created_at_formated"],
//     );

// }
