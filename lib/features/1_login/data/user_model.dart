import 'package:cloud_firestore/cloud_firestore.dart';

class UserLoginModel {
  UserModel? data;
  String? token;

  UserLoginModel({this.data, this.token});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['token'] = token;
    return data;
  }
}

//[{"id":1,"user_iduser_id":18,"first_name":"Admin","last_name":"User","email":"admin@example.com",
// "phone":"1234567890","address":"123 Admin St, Admin City, Admin State",
// "national_id":"A12345678","gender":"male","roles":"admin","state":"active"},
class UserModel {
  late String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? status;
  String? address;
  String? nationalId;
  String? gender;
  String? avatar;
  String? role;
  String? birthDate;

  UserModel({
    this.userId,
    this.firstName = '',
    this.lastName = '',
    this.email,
    this.status = 'inactive',
    this.phone,
    this.address,
    this.gender,
    this.birthDate,
    this.nationalId,
    this.avatar,
    this.role,
  });

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return UserModel.fromJson(data)..userId = snapshot.id; // Optional: Assign document ID as userId
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    status = json['status'];
    nationalId = json['national_id'];
    gender = json['gender'];
    role = json['roles']??json['role'];
    avatar = json['avatar'] ?? '';
    birthDate = json['birth_date']?.toString().replaceAll('Z', '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['status'] = status;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['national_id'] = nationalId;
    data['gender'] = gender;
    data['role'] = role;
    data['avatar'] = avatar;
    data['birth_date'] = birthDate?.toString().replaceAll('Z', '');
    return data;
  }
}